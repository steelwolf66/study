#/bin/bash
docker run -d \
-p 2181:2181 \
-v /mysoft/zookeeper/data/:/data/ \
--name=zookeeper  \
--privileged zookeeper
