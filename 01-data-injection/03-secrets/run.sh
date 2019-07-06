#!/bin/bash

chmod +x setup.sh
chmod +x 00-secret.sh
chmod +x 01-env-var-secret.sh
chmod +x 02-multiple-secrets.sh
chmod +x 03-kv.sh
chmod +x teardown.sh

./setup.sh
./00-secret.sh
./01-env-var-secret.sh
./02-multiple-secrets.sh
./03-kv.sh
./teardown.sh