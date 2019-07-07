#!/bin/bash

linkerd inject deployment.yaml
linkerd inject deployment.yaml | kubectl apply -f -
nohup linkerd dashboard &