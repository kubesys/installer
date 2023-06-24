## Kubernetes


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Compute virtualization  | 1.6.21    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env container |
|  Docker     | Compute virtualization  | 23.0.6    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env container |
| kubeovn     | Network virtualization  | 1.1.6   | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-network kubeovn |
| Ceph        | Storae virtualization         | 4.4.16     | [Linux](https://docs.min.io/minio/k8s/reference/minio-kubectl-plugin.html#command-kubectl-minio)            |            30303,30304      |              NA              | init-storage minio |
| Mino        | Storae virtualization         | 4.4.16     | [Linux](https://docs.min.io/minio/k8s/reference/minio-kubectl-plugin.html#command-kubectl-minio)            |            30303,30304      |              NA              | init-storage minio |
| Kubernetes  | Virtual resource Pool        | 1.27.3     | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              | init-compute container |

updated: 2023.6.24
