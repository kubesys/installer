#! /bin/bash
###############################################
##
##  Copyright (2021, ) Institute of Software
##      Chinese Academy of Sciences
##          wuheng@iscas.ac.cn
##
###############################################

function get-arch()
{
  if [[ $(arch) == "x86_64" ]]
  then
    echo "amd64"
  elif [[ $(arch) == "aarch64" ]]
  then
    echo "arm64"
  else
    echo "only support x86_64(amd64) and aarch64(arm64)"
    exit 1
  fi
}

docker run  --privileged=true -d -p 31003:8080 -v /home/superset:/home/superset --name superset superset:v1.3.0
docker exec -it superset superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

docker exec -it superset superset db upgrade
docker exec -it superset superset load_examples
docker exec -it superset superset init
docker exec -it superset pip install psycopg2 sqlalchemy-drill pydruid pyhive impyla kylinpy pinotdb sqlalchemy-solr pyhive pybigquery cockroachdb elasticsearch-dbapi mysqlclient pymssql cx_Oracle
arch=`get-arch`
docker commit superset registry.cn-beijing.aliyuncs.com/dosproj/superset:v1.3.0-$arch
docker push registry.cn-beijing.aliyuncs.com/dosproj/superset:v1.3.0-$arch
