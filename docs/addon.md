## addon


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| keycloak    | IAM       |  21.1    | [Linux](https://www.keycloak.org/)   | 80:30300,443:30301,9990:30302 | NA | init-addon keycloak |
| Loki        | Log Observer         | 2.8.2    | [Linux](https://grafana.com/oss/loki/)              |            NA                |              NA            |init-addon loki| 
| Prometheus  | status Observer      | 2.45.0   | [Linux](https://github.com/prometheus/prometheus/)  |         9090/31003           |              NA              |init-addon prometheus |
| grafana     | NoSQL-based Analyzer | 10.0.1    | [Linux](https://community.grafana.com/)             |         3000/31004           |              NA              |init-addon grafana|
| superset    | SQL-based Analyzer   | 2.0.1    | [Linux](https://superset.apache.org//)              |         8088/31005           |              NA              |init-addon superset|
| postgres    | Relational database   | 15.3    | [Linux](https://superset.apache.org//)              |         8088/31005           |              NA              |init-addon superset|

updated: 2023-06-24
