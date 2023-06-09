ARG OS_VERSION
#FROM ${OS_VERSION}
FROM ubuntu:20.04 
#FROM ubuntu:22.04 

RUN apt-get -y update   
RUN apt-get -y upgrade 
RUN apt-get -y install openssh-client openssh-server 
RUN apt-get -y install iputils-ping curl net-tools vim 

RUN useradd user1

ADD webapp1/webapp1 /webapp1
ADD webapp2/webapp2 /webapp2
ADD run.sh /run.sh
RUN chmod 777 /run.sh
CMD /run.sh 
