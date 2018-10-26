#!/bin/bash

sudo docker build -t qitas/mosquitto ./image/

#run it
docker run -it -p 1883:1883 -p 9001:9001 -v <path-to-configuration-file>:/mosquitto/config/mosquitto.conf -v /mosquitto/data -v /mosquitto/log  --name mosquitto qitas/mosquitto

