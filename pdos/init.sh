#! /bin/bash
###############################################
##
##  Copyright (2020, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@gmail.com
##
###############################################

if [ ! -f "/var/lib/pdos/" ];
then
  mkdir /var/lib/pdos/
fi

kubectl apply -f configs/01.crd.yaml
kubectl apply -f configs/02.system.yaml
kubectl apply -f configs/03.rbac.yaml
kubectl apply -f configs/frontend/

cp -r jsons/* /var/lib/pdos/
