#!/bin/bash

chmod +x setup.sh
chmod +x 00-job.sh
chmod +x teardown.sh

./setup.sh
./00-job.sh
./teardown.sh