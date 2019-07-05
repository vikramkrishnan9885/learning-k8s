#!/bin/bash

chmod +x setup.sh
chmod +x 00-cmd-liveness.sh
chmod +x 01-http-liveness.sh
chmod +x 02-tcp-liveness.sh
chmod +x teardown.sh

./setup.sh
./00-cmd-liveness.sh
./01-http-liveness.sh
./02-tcp-liveness.sh
./teardown.sh