#!/bin/bash

chmod +x setup.sh
chmod +x 00-cronjob.sh
chmod +x teardown.sh

./setup.sh
./00-cronjob.sh
./teardown.sh