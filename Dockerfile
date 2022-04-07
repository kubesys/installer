FROM centos:7

RUN mkdir -p /home/kubeinst
RUN yum install -y wget

ADD kubeinst /home/kubeinst/
ADD dd /home/kubeinst/

WORKDIR /home/kubeinst
