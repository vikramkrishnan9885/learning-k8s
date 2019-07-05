#!/bin/bash
chmod +x setup.sh
chmod +x 00-memory.sh
chmod +x 01-exceed-lim.sh
chmod +x 02-large-req.sh
chmod +x teardown.sh


./setup.sh
./00-memory.sh
./01-exceed-lim.sh
./02-large-req.sh
./teardown.sh