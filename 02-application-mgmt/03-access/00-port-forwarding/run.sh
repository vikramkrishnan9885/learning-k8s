#!/bin/bash

chmod +x setup.sh
chmod +x 00-cmd.sh
chmod +x teardown.sh

./setup.sh
./00-cmd.sh
./teardown.sh