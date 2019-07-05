#!/bin/bash

chmod +x setup.sh
chmod +x 00-pod-sec-context.sh
chmod +x 01-container-sec-context.sh
chmod +x teardown.sh

./setup.sh
./00-pod-sec-context.sh
./01-container-sec-context.sh
./teardown.sh