# rabbitmq as the base image
FROM rabbitmq:latest

MAINTAINER qitas <qitas@qitas.cn>

# amqp port
EXPOSE 5672
# tcp port
EXPOSE 1883
# ws port
EXPOSE 15675
# management port
EXPOSE 15672

#enable plugins
RUN rabbitmq-plugins enable rabbitmq_management
RUN rabbitmq-plugins enable rabbitmq_mqtt
RUN rabbitmq-plugins enable rabbitmq_web_mqtt

#RUN rabbitmq-plugins enable rabbitmq_web_mqtt_examples

#RUN service rabbitmq-server stop
#RUN chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
#RUN service rabbitmq-server start
#power on start 
#RUN chkconfig rabbitmq-server on

# run shell
ADD ./run.sh /run.sh
RUN chmod +x /run.sh

#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash","./run.sh"]

RUN echo "congratulations,your rabbitmq image is finished."
