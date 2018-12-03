#!/bin/bash

#add you shell 
echo "in run.sh shell"

service rabbitmq-server stop
sleep 5
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
sleep 1
service rabbitmq-server start
sleep 5

rabbitmqctl add_user  test  test123456
rabbitmqctl set_user_tags qitas administrator
rabbitmqctl delete_user  guest
rabbitmqctl list_users

echo "done qitas configure"
service rabbitmq-server stop
sleep 4
rabbitmq-server on
