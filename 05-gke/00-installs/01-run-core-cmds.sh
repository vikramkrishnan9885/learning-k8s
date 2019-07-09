#!/bin/bash


##########################################################
#
#  gcloud defaults used:
#    * Commands that require authentication will use kvikram9885@gmail.com by default
#    * Commands will reference project `my-project-cpb100-180518` by default
#    * Compute Engine commands will use region `us-central1` by default
#    * Compute Engine commands will use zone `us-central1-b` by default
#
############################################################

gcloud auth list

gcloud config list

gcloud info

# Check that help works
gcloud help compute instances create