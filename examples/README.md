
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
