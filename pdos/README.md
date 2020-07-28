## Installation

### download the `kubeinst` tool.

```
curl --url https://raw.githubusercontent.com/kubesys/kubernetes-installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

### init Kubernetes env

you can edit /usr/bin/kubeinst to config your Kubernetes version

```
kubeinst init-env
curl https://raw.githubusercontent.com/kubesys/kubernetes-installer/master/pdos/kubeinst-plugin | bash
```

### install Kubernetes

you can  edit /etc/kubernetes/kubeadm.yaml to config Kubernetes info
you can also edit /etc/kubernetes/kubeenv.list to add more plugins

```
kubeinst init-kube
```


Now you can enjoy it


## System info

- Core
  - etcd
    - 2379
    - 2380
    - 2381
  - [OpenvsWitch](https://github.com/kubesys/kubernetes-libnvf)
    - 6641
    - 6642
  - Kubernetes
    - 6443
    - 10250
    - 10251
    - 30000-32767
- Monitoring
  - [grafana/prometheus/loki](https://github.com/kubesys/kubernetes-tools/tree/master/ops/prom)
    - 31001 [prometheus-http-port]
    - 31002 [grafana-http-port]
- DevOps
  - [teamwork](https://github.com/kubesys/kubernetes-tools/tree/master/dev/team)
    - 30311 [kooteam-http-port]
  - [gitlab](https://github.com/kubesys/kubernetes-tools/tree/master/dev/gitlab)
    - 30312 [gitlab-ssh-port]
    - 30313 [gitlab-http-port]
    - 30314 [gitlab-https-port]
- Qin
  - kube-rabbitmq
    - 30304 [rabbit-port]
    - 30305 [rabbit-management-http-port]
  - kube-database
    - 30306 [mariadb-port]
    - 30307 [mariadb-management-http-port]
  - [kube-synchronizer](https://github.com/kubesys/kubernetes-synchronizer)
  - [kube-orchestrator](https://github.com/kubesys/kubernetes-orchestrator)
  - [kube-operators](https://github.com/kubesys/kubernetes-operators)
    - 30308 [operators-http-port]
    - 30309 [operators-https-port]
  - [kube-dashboard](https://github.com/kubesys/kubeext-dashboard)
    - 30310 [dashboard-http-port]
