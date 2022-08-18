## Kubernetes


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Container        | 1.6.7    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env container |
| Kubernetes  | Orchestrator     | 1.24     | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              | init-compute container |
| Calico      | Network          | 3.24   | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-network calico |
| Flannel      | Network          | 0.19.1   | [Linux](https://github.com/flannel-io/flannel/releases)            |            NA                |              NA              | init-network flannel |
| Postgres    | Database         | 14.5     | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-storage postgres |

updated: 2022.5.5
