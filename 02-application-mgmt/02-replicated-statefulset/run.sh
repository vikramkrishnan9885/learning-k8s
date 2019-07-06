#!/bin/bash

chmod +x setup.sh
chmod +x 00-deployment.sh
chmod +x teardown.sh

./setup.sh
./00-deployment.sh
./teardown.sh