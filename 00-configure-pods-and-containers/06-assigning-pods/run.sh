#!/bin/bash

chmod +x setup.sh
chmod +x 00-assign-pod.sh
chmod +x teardown.sh

./setup.sh
./00-assign-pod.sh
./teardown.sh