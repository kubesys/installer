## addon


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| keycloak    | IAM                  |  21.1    | [Linux](https://www.keycloak.org/)                  |         8080:30301       | NA | init-addon keycloak |
| Loki        | Log Observer         | 2.8.2    | [Linux](https://grafana.com/oss/loki/)              |            NA             | NA |init-addon loki| 
| Prometheus  | status Observer      | 2.45.0   | [Linux](https://github.com/prometheus/prometheus/)  |  9090/30301, 9100/30302, 9090/30303 | NA |init-addon prometheus |
| superset    | SQL-based Analyzer   | 2.0.1    | [Linux](https://superset.apache.org/)               |         8088/30305        | NA |init-addon superset|
| postgres    | Relational database   | 15.3    | [Linux](https://www.postgresql.org/)                |   5432/30306,8080/30307   | NA |init-addon postgres|
| rabbitmq    | message middleware    | 3.12.0  | [Linux](https://www.rabbitmq.com/)                  |   5672/30304,15672/30305   | NA |init-addon rabbitmq|

updated: 2023-06-24
