## addon


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Loki        | Log Observer          | 2.8.2   | [Linux](https://grafana.com/oss/loki/)              |          3100/30300                 | NA |init-addon loki| 
| Prometheus  | status Observer       | 2.45.0  | [Linux](https://github.com/prometheus/prometheus/)  |  9090/30301, 9100/30302, 9090/30303 | NA |init-addon prometheus |
| rabbitmq    | message middleware    | 3.12.0  | [Linux](https://www.rabbitmq.com/)                  |   5672/30304,15672/30305            | NA |init-addon rabbitmq|
| postgres    | Relational database   | 15.3    | [Linux](https://www.postgresql.org/)                |   5432/30306,8080/30307             | NA |init-addon postgres|
| Habor       | Repositories          | 2.8.3   | [Linux](https://www.habor.com/en/)                  |         8080:30308                  | NA | init-addon harbor |

updated: 2023-06-24
