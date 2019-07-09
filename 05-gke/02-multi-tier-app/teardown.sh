#!/bin/bash

kubectl delete service frontend
sleep 5m
gcloud container clusters delete guestbook