FROM superset:v1.3.0
# https://superset.apache.org/docs/databases/installing-database-drivers

RUN superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

RUN superset db upgrade
RUN superset load_examples
RUN superset init
RUN pip install psycopg2 sqlalchemy-drill pydruid pyhive impyla kylinpy pinotdb sqlalchemy-solr pyhive pybigquery cockroachdb elasticsearch-dbapi mysqlclient pymssql cx_Oracle 
