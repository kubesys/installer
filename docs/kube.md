## Kubernetes


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Container        | 1.6.x    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env container |
| Kubernetes  | Orchestrator     | 1.23     | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              | init-compute container |
| Calico      | Network          | 3.22.2   | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-network calico |
| Postgres    | Database         | 14.2     | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-storage postgres |

updated: 2022.5.5
