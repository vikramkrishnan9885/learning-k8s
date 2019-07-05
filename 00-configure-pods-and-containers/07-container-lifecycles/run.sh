#!/bin/bash 

chmod +x start.sh
chmod +x 00-init-containers.sh
chmod +x 01-lifecycle-hook.sh
chmod +x teardown.sh

./start.sh
./00-init-containers.sh
./01-lifecycle-hook.sh
./teardown.sh