#!/bin/bash

chmod +x setup.sh
chmod +x 00-redis-storage.sh
chmod +x 01-persistent-vol.sh
chmod +x 02-proj-vol.sh
chmod +x teardown.sh

./setup.sh
./00-redis-storage.sh
./01-persistent-vol.sh
./02-proj-vol.sh
./teardown.sh