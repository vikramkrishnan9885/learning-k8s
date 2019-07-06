#!/bin/bash

chmod +x setup.sh
chmod +x 00-envars.sh
chmod +x 01-pods-fields-val-for-env-var.sh
chmod +x 02-container-fields-as-val-for-env-var.sh
chmod +x 03-pod-info-to-cont-thru-files.sh
chmod +x teardown.sh

./setup.sh
./00-envars.sh
./01-pods-fields-val-for-env-var.sh
./02-container-fields-as-val-for-env-var.sh
./03-pod-info-to-cont-thru-files.sh
./teardown.sh