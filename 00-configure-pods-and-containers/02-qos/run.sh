#!/bin/bash

chmod +x setup.sh
chmod +x 00-guaranteed.sh
chmod +x 01-burstable.sh
chmod +x 02-best-effort.sh
chmod +x teardown.sh

./setup.sh
./00-guaranteed.sh
./01-burstable.sh
./02-best-effort.sh
./teardown.sh