#!/bin/bash

########################################################
#
#   STEP 0: START MINIKUBE AND PRE-CHECK FOR LINKERD SUITABILITY
#
########################################################

minikube start
linkerd check --pre

########################################################
#
#   STEP 1: INSTALL THE APP
#
########################################################

kubectl create ns booksapp && \
  curl -sL https://run.linkerd.io/booksapp.yml \
  | kubectl -n booksapp apply -f -

# Downloading a bunch of containers for the first time takes a little while. Kubernetes can tell you when all the services are running and ready for traffic. Wait for that to happen by running:
kubectl -n booksapp rollout status deploy webapp

# You can also take a quick look at all the components that were added to your cluster by running:
kubectl -n booksapp get all

# Once the rollout has completed successfully, you can get access to the app itself by port-forwarding webapp locally:
kubectl -n booksapp port-forward svc/webapp 7000

# cURL localhost
curl http://localhost:7000/ 

########################################################
#
#   STEP 2: ADD LINKERD
#
########################################################

kubectl get -n booksapp deploy -o yaml \
  | linkerd inject - \
  | kubectl apply -f -


########################################################
#
#   STEP 3: SERVICE PROFILES
#
########################################################

# One of the easiest ways to get service profiles setup is by using existing OpenAPI (Swagger) specs. This demo has published specs for each of its services. You can create a service profile for webapp by running:

curl -sL https://run.linkerd.io/booksapp/webapp.swagger \
  | linkerd -n booksapp profile --open-api - webapp \
  | kubectl -n booksapp apply -f -

# This command will do three things:
#   * Fetch the swagger specification for webapp.
#   * Take the spec and convert it into a service profile by using the profile command.
#   * Apply this configuration to the cluster.

# To get profiles for authors and books, you can run:
curl -sL https://run.linkerd.io/booksapp/authors.swagger \
  | linkerd -n booksapp profile --open-api - authors \
  | kubectl -n booksapp apply -f -
curl -sL https://run.linkerd.io/booksapp/books.swagger \
  | linkerd -n booksapp profile --open-api - books \
  | kubectl -n booksapp apply -f -

# Verifying that this all works is easy when you use linkerd tap. Each live request will show up with what :authority or Host header is being seen as well as the :path and rt_route being used. Run:
linkerd -n booksapp tap deploy/webapp -o wide | grep req

# These metrics are part of the linkerd routes command instead of linkerd stat. To see the metrics that have accumulated so far, run:
linkerd -n booksapp routes svc/webapp

# This will output a table of all the routes observed and their golden metrics. The [DEFAULT] route is a catch all for anything that does not match the service profile.
# Profiles can be used to observe outgoing requests as well as incoming requests. To do that, run:
linkerd -n booksapp routes deploy/webapp --to svc/books


########################################################
#
#   STEP 4: RETRIES
#
########################################################

# As it can take awhile to update code and roll out a new version, 
# let’s tell Linkerd that it can retry requests to the failing 
# endpoint. This will increase request latencies, as requests will 
# be retried multiple times, but not require rolling out a new version.

# In this application, the success rate of requests from the books 
# deployment to the authors service is poor. To see these metrics, run:

linkerd -n booksapp routes deploy/books --to svc/authors

# kubectl -n booksapp edit sp/authors.booksapp.svc.cluster.local
# You'll want to add isRetryable to a specific route. It should look like:

# spec:
#  routes:
#  - condition:
#      method: HEAD
#      pathRegex: /authors/[^/]*\.json
#    name: HEAD /authors/{id}.json
#    isRetryable: true ### ADD THIS LINE ###

linkerd -n booksapp routes deploy/books --to svc/authors -o wide


########################################################
#
#   STEP 5: TIMEOUTS
#
########################################################

# To get started, let’s take a look at the current latency for requests from webapp to the books service:
linkerd -n booksapp routes deploy/webapp --to svc/books

# To edit the books service profile, run:
kubectl -n booksapp edit sp/books.booksapp.svc.cluster.local

# Update the PUT /books/{id}.json route to have a timeout:

# spec:
#  routes:
#  - condition:
#      method: PUT
#      pathRegex: /books/[^/]*\.json
#    name: PUT /books/{id}.json
#    timeout: 25ms ### ADD THIS LINE ###

# Linkerd will now return errors to the webapp REST client when the timeout is reached. This timeout includes retried requests and is the maximum amount of time a REST client would wait for a response.

# Run routes to see what has changed:
linkerd -n booksapp routes deploy/webapp --to svc/books -o wide


########################################################
#
#   STEP 6: TEARDOWN
#
########################################################


minikube stop
minikube delete