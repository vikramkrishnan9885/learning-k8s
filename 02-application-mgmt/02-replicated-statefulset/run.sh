#!/bin/bash

chmod +x setup.sh
chmod +x 00-deployment.sh
chmod +x 01-patching-deployments.sh
chmod +x teardown.sh

./setup.sh
./00-deployment.sh
./01-patching-deployments.sh
./teardown.sh