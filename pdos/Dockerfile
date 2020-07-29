FROM centos:7

RUN mkdir /home/kubernetes-init
ADD init.sh /home/kubernetes-init
ADD configs /home/kubernetes-init/configs
ADD jsons /home/kubernetes-init/jsons

WORKDIR /home/kubernetes-init
