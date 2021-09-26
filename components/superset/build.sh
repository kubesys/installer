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
