#!/bin/bash

chmod +x setup.sh
chmod +x 00-create-cm-from-dir.sh
chmod +x 01-create-cm-from-file.sh
chmod +x 02-create-cm-from-env-file.sh
chmod +x 03-create-cm-from-literals.sh
chmod +x 04-generator.sh
chmod +x 05-pod-single-configmap-env-variable.sh
chmod +x 06-pod-multiple-configmap-env-variable.sh
chmod +x 07-config-map-multikeys.sh
chmod +x 08-use-cm-defined-env-var-in-pod-cmds.sh
chmod +x 09-add-cm-data-to-vol.sh
chmod +x 10-add-cm-data-to-specific-path.sh
chmod +x teardown.sh

./setup.sh
./00-create-cm-from-dir.sh
./01-create-cm-from-file.sh
./02-create-cm-from-env-file.sh
./03-create-cm-from-literals.sh
./04-generator.sh
./05-pod-single-configmap-env-variable.sh
./06-pod-multiple-configmap-env-variable.sh
./07-config-map-multikeys.sh
./08-use-cm-defined-env-var-in-pod-cmds.sh
./09-add-cm-data-to-vol.sh
./10-add-cm-data-to-specific-path.sh
./teardown.sh