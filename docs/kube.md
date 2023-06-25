## Kubernetes

### centos7

| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Compute virtualization  | 1.6.21    | [Linux](https://containerd.io/docs/getting-started/)|            NA     |    NA   | init-env container |
|  Docker     | Compute virtualization  | 23.0.6    | [Linux](https://containerd.io/docs/getting-started/)|            NA     |    NA   | init-env container |
| kubeovn     | Network virtualization  | 1.11.8    | [Linux](https://docs.projectcalico.org/)            |             NA     |    NA   | init-network kubeovn |
| Ceph        | Storae virtualization   | 18.1.1   | [Linux](ceph.com)                                   |       8443/30000   |    NA   | init-storage ceph |
| Kubernetes  | Virtual resource Pool   | 1.27.3    | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 | NA  | init-compute container |

updated: 2023.6.24
