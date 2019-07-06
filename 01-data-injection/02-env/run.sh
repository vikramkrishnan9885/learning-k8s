#!/bin/bash

chmod +x setup.sh
chmod +x 00-envars.sh
chmod +x teardown.sh

./setup.sh
./00-envars.sh
./teardown.sh