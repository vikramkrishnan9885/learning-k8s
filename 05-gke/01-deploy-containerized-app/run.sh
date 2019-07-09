#!/bin/bash

chmod +x 00-create-image.sh
chmod +x 01-upload-img.sh
chmod +x 02-create-clusters-deploy.sh

./00-create-image.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out
./01-upload-img.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out
./02-create-clusters-deploy.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out
bash 03-scale-app.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out
bash 04-deploy-new-version.sh |ts '[%Y-%m-%d %H:%M:%S]' &>>out

bash teardown.sh