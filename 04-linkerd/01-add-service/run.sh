#!/bin/bash

chmod +x setup.sh
chmod +x deploy.sh
chmod +x teardown.sh

./setup.sh
./deploy.sh
sleep 5m
./teardown.sh
