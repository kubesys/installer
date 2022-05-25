## addon


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Loki        | Log Observer         | 2.5.0    | [Linux](https://grafana.com/oss/loki/)              |            NA                |              NA              |init-addon loki| 
| supertokens | Auth                 | 3.13    | [Linux][(https://supertokens.com/docs/thirdpartyemailpassword/quick-setup/database-setup/postgresql)]             |            3567:31000                |              NA              |init-addon tokens| 
| Prometheus  | status Observer      | 2.34.0   | [Linux](https://github.com/prometheus/prometheus/)  |         9090/31001           |              NA              |init-addon prometheus |
| grafana     | NoSQL-based Analyzer | 8.5.0    | [Linux](https://community.grafana.com/)             |         3000/31002           |              NA              |init-addon grafana|
| superset    | SQL-based Analyzer   | 1.5.0    | [Linux](https://superset.apache.org//)              |         8088/31003           |              NA              |init-addon superset|


updated: 2022-5-5
