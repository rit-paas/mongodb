# Single Instance MongoDB 3

FROM centos:7
MAINTAINER CloudWerkstatt

# https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.7.tgz

ENV MONGODB_VERSION 3.0.7
ENV MONGODB_HOME /opt/mongodb
ENV MONGODB_DATA /data/db

RUN cd $HOME \
    && mkdir -p $MONGODB_DATA \

    && yum -y update \
    && yum clean all \
    && curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGODB_VERSION.tgz \

    && tar xzvf mongodb-linux-x86_64-$MONGODB_VERSION.tgz \
    && rm -f *.tgz \
    && mv mongodb-linux-x86_64-$MONGODB_VERSION $MONGODB_HOME \

    && chmod -R 777 $MONGODB_HOME \
    && chmod -R 777 $MONGODB_DATA \

    && useradd default

ADD container-files /

EXPOSE 27017

USER default

CMD "/docker-entrypoint.sh"
