#!/bin/bash
#build images
sudo docker build -t qitas/rabbitmq ./image/

#start it
#nouse -p 4369:4369 -p 5671:5671  -p 8883:8883  -p 25672:25672 
sudo docker run -itd -p 1883:1883 -p 5672:5672 -p 15672:15672 -p 15675:15675 --name mqtt qitas/rabbitmq # /bin/bash #./run.sh

#open web
x-www-browser http://localhost:15672
