#!/bin/bash

chmod +x setup.sh
chmod +x 00-commands.sh
chmod +x 01-env-var-for-args.sh
chmod +x teardown.sh

./setup.sh
./00-commands.sh
./01-env-var-for-args.sh
./teardown.sh