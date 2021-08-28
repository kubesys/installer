###########################################
##
## Copyright (2021, ) Institute of Software
##     Chinese Academy of Sciences
##      wuheng@otcaix.iscas.ac.cn
##
###########################################

version="1.8.4"

docker pull coredns/coredns:$version

docker tag coredns/coredns:$version registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$version
