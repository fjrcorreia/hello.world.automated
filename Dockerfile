
FROM centos:7
MAINTAINER Francisco Correia <fjrcorreia@github.com>

USER root

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## Required tools, at least for me...
RUN 	yum install -y wget tar nano && yum clean all


## Get Java from the web
RUN 	cd /tmp && wget --no-check-certificate --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        -O jdk-linux-x64.rpm "http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.rpm" && \
		yum install -y jdk-linux-x64.rpm && rm jdk-linux-x64.rpm && yum clean all


## Java Environment variables
ENV JAVA_HOME  /usr/java/default
ENV CLASSPATH  .:/usr/java/default/lib


# launch a Console as default
CMD ["/bin/bash"]
