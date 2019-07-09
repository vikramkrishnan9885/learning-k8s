#!/bin/bash

chmod +x 00-setup.sh
chmod +x 01-pvc.sh
chmod +x 02-mysql.sh
chmod +x 03-wp.sh
chmod +x teardown.sh

./00-setup.sh
./01-pvc.sh
./02-mysql.sh
./03-wp.sh
./teardown.sh