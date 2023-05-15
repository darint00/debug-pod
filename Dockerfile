ARG OS_VERSION
FROM ${OS_VERSION}
#FROM ubuntu:20.04 

RUN apt-get -y update   
RUN apt-get -y install iputils-ping 
RUN apt-get -y install curl 

RUN useradd user1

