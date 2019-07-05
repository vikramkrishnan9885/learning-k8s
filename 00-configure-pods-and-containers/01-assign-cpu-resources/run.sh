#!/bin/bash
chmod +x setup.sh
chmod +x 00-cpu.sh
chmod +x 01-exceed-lim.sh
chmod +x teardown.sh


./setup.sh
./00-cpu.sh
./01-exceed-lim.sh
./teardown.sh