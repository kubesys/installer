## kubeInstaller

Install Kubernetes-based systems with a simple and comprehensible way.
Now this script can only work in CentOS/RHEL 7.x with various CPU arch.


| Name        | Type      | Version |  Packages  |   
| ------      | ------    | ------  | ------      |
| Docker      | Container-based virtualization | 19.03   | [redhat](https://docs.docker.com/install/linux/docker-ee/rhel/), [openSUSE/SUSE](https://docs.docker.com/install/linux/docker-ee/suse/), [centos](https://docs.docker.com/install/linux/docker-ce/centos/), [debian](https://docs.docker.com/install/linux/docker-ce/debian/), [fedora](https://docs.docker.com/install/linux/docker-ce/fedora/), [ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) |
| Kubernetes  | Virtual compute resource pool  | 1.18.2  | [Linux](https://docs.kubernetes.io/) |
| Calico      | Network solution        | 3.14  | [Linux](https://docs.projectcalico.org/v3.14/getting-started/kubernetes/) |
| Prometheus  | Monitor tool            | 2.19  | [Linux](https://github.com/prometheus/prometheus/) |


## Installation

download the `kubeinst` tool.

```
curl --url https://raw.githubusercontent.com/kubesys/kubernetes-installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

Now it support two commands

```
Commands:
  init-env       :	(Init): simplify configuring node, such as disable selinux, install docker
  init-kube      :	(Init): deploy Kubernetes as your want
```

- Using the `init-env` command, you can install Docker and Kubernetes on a just installed OS.
- Using the `init-kube` commnad, you can install kubernetes as your want

```
kubeinst init-env
kubeinit init-kube
```

Note that you can customized :

- Kubernetes configuration by /etc/kubernetes/kubeadm.yaml
- Kubernetes addons by /etc/kubernetes/kubeenv.list

## Roadmap

- Prototype
  - 0.1: support Kubernetes and Calico
  - 0.2: support prometheus, grafna
  - 0.3: support loki, register
  - 0.4: support Helm, Rook
  - 0.5: support istio
  - 0.6: support volcano
  - 0.7: support openfaas
- Develop

- Production
