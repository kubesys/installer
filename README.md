## kubeInstaller

Install Kubernetes-based systems with a simple and comprehensible way.
Now this script can only work in CentOS/RHEL 7.x with various CPU arch.


| Name        | Type      | Version |  Packages  |   
| ------      | ------    | ------  | ------      |
| Docker      | Container-based virtualization | 19.03   | [redhat](https://docs.docker.com/install/linux/docker-ee/rhel/), [openSUSE/SUSE](https://docs.docker.com/install/linux/docker-ee/suse/), [centos](https://docs.docker.com/install/linux/docker-ce/centos/), [debian](https://docs.docker.com/install/linux/docker-ce/debian/), [fedora](https://docs.docker.com/install/linux/docker-ce/fedora/), [ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) |
| Kubernetes  | Virtual compute resource pool  | 1.18.2  | [Linux](https://docs.kubernetes.io/) |
| Calico      | Network solution        | 3.14  | [Linux](https://docs.projectcalico.org/v3.14/getting-started/kubernetes/) |
| Prometheus  | Monitor tool            | 2.20  | [Linux](https://github.com/prometheus/prometheus/) |


## Installation

download the `kubeinst` tool.

```
curl --url https://raw.githubusercontent.com/kubesys/kubernetes-installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst

kubeinst init-env
kubeinst init-kube
```

Now it support two commands

```
Commands:
  init-env       :	(Init): simplify configuring node, such as disable selinux, install docker
  init-kube      :	(Init): deploy Kubernetes as your want
```

- Using the `init-env` command, you can install Docker and Kubernetes on a just installed OS.
- Using the `init-kube` commnad, you can install kubernetes as your want


Note that you can customized :

- /etc/kubernetes/kubeadm.yaml： how to install Kubernetes
- /etc/kubernetes/kubeenv.list: which plugins should be installed


## Note

```
apiVersion: kubeadm.k8s.io/v1beta2
kind: InitConfiguration
bootstrapTokens:
  - ttl: "0"
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
apiServer:
  certSANs:
    - 127.0.0.1
    - 172.17.110.156
    - 39.106.40.190
networking:
  podSubnet: "10.244.0.0/16"
kubernetesVersion: "v1.18.3"
imageRepository: "registry.cn-hangzhou.aliyuncs.com/google_containers"
```


## Install Kubernetes with HA

### . Prepare

1.1 Plan

```
Masters：
192.168.42.136
192.168.42.133
192.168.42.134

Slave
192.168.42.132
```
1.2 Ansible (Every Nodes)

```
yum install epel-release centos-release-openstack-rocky -y
yum install docker-ce docker-ce-cli keepalived haproxy git python-pip -y
systemctl start docker
systemctl enable docker
pip install pip --upgrade -i https://mirrors.aliyun.com/pypi/simple/
pip install ansible==2.6.18 netaddr==0.7.19 -i https://mirrors.aliyun.com/pypi/simple/
```

1.3 Login using ssh without password (Every Nodes)

```
ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/id_rsa
ssh-copy-id $IPs (All Nodes)
```

1.4 Get scripts

```
git clone https://github.com/easzlab/kubeasz /etc/ansible
cd /etc/ansible && cp example/hosts.multi-node hosts

cd /etcd/ansible/bin

wget http://39.106.124.113/uit/cmds.tar.gz

tar zxvf cmds.tar.gz
```

### Install

```
cd /etc/ansible
vi hosts, config the following as you want

[etcd]
192.168.42.136 NODE_NAME=etcd1
192.168.42.133 NODE_NAME=etcd2
192.168.42.134 NODE_NAME=etcd3

# master node(s)
[kube-master]
192.168.42.136
192.168.42.133
192.168.42.134

# work node(s)
[kube-node]
192.168.42.132

# Network plugins supported: calico, flannel, kube-router, cilium, kube-ovn
CLUSTER_NETWORK="kube-ovn"

[ex-lb]
192.168.42.136 LB_ROLE=master EX_APISERVER_VIP=192.168.42.250 EX_APISERVER_PORT=6443
192.168.42.133 LB_ROLE=backup EX_APISERVER_VIP=192.168.42.250 EX_APISERVER_PORT=6443
192.168.42.134 LB_ROLE=backup EX_APISERVER_VIP=192.168.42.250 EX_APISERVER_PORT=6443
```

1. Install

```
ansible-playbook 01.prepare.yml (以最终显示状态为准，中间有红色输出可忽略)
ansible-playbook 02.etcd.yml (以最终显示状态为准，中间有红色输出可忽略)
ansible-playbook 04.kube-master.yml (以最终显示状态为准，中间有红色输出可忽略)
ansible-playbook 05.kube-node.yml (以最终显示状态为准，中间有红色输出可忽略)
```

2. ex-lb

vi  roles/ex-lb/defaults/main.yml

```
# 启用 ingress NodePort服务的负载均衡 (yes/no)
INGRESS_NODEPORT_LB: "no"
# 启用 ingress tls NodePort服务的负载均衡 (yes/no)
INGRESS_TLS_NODEPORT_LB: "no"
```

ansible-playbook /etc/ansible/roles/ex-lb/ex-lb.yml

bash patch.sh

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
