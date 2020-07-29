#! /bin/bash
###############################################
##
##  Copyright (2020, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@gmail.com
##
###############################################

kubectl apply -f configs/*.yaml
kubectl apply -f configs/frontend/*.yaml

cp -r jsons/* /var/lib/pdos/
