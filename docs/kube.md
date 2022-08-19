## Kubernetes


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Container        | 1.6.7    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env container |
| Kubernetes  | Orchestrator     | 1.24     | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              | init-compute container |
| Calico      |  L3 Security Network  | 3.24   | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-network calico |
| Flannel      | L3 Network          | 0.19.1   | [Linux](https://github.com/flannel-io/flannel/releases)            |            NA                |              NA              | init-network flannel |
| Postgres    | SQL storage      | 14.5     | [Linux](https://docs.projectcalico.org/)            |            30306,30307      |              NA              | init-storage postgres |
| MinIO    | Object         | 4.4.16     | [Linux](https://docs.min.io/minio/k8s/reference/minio-kubectl-plugin.html#command-kubectl-minio)            |            30303,30304      |              NA              | init-storage minio |

updated: 2022.8.19
