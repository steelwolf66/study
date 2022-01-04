#/bin/bash

docker run --name='activemq' \
      -itd \
	  -p 8161:8161 \
	  -p 61616:61616 \
	  -e ACTIVEMQ_ADMIN_LOGIN=admin \
	  -e ACTIVEMQ_ADMIN_PASSWORD=123456 \
	  --restart=always \
	  -v /home/activeMQ:/data/activemq \
	  -v /home/activeMQ/log:/var/log/activemq \
	  webcenter/activemq:latest
