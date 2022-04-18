## installer

Install Kubernetes-based systems with a simple and comprehensible way.
** Note **
- this script can work well on CentOS/RHEL 7.x/8.x and Ubuntu 18.x/20.x.
- we test this script on Kubernetes >=1.18

## Supported

- ShanDong Provincial Key Research and Development Program, China (2021CXGC010101)

## Architecture

Our installer is used in a shell - bare metal machine way. Its framework is shown as below:

![framework](./others/framework.jpg)

## Matrix


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |   command  |      
| ------      | ------    | ------  | ------      |   -----   |    -----  |   -----   |
| Containerd  | Container        | 1.6.x    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              | init-env/init-kube container |
| Kubernetes  | Orchestrator     | 1.23.x   | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              | init-env/init-kube vm |
| Calico      | Network          | 3.22.x   | [Linux](https://docs.projectcalico.org/)            |            NA                |              NA              | init-cni calico |
| Loki        | Log              | 2.4.x    | [Linux](https://grafana.com/oss/loki/)              |            NA                |              NA              |init-addon loki| 
| Prometheus  | Monitor          | 2.33.x   | [Linux](https://github.com/prometheus/prometheus/)  |         9090/31001           |              NA              |init-addon prometheus |
| grafana     | Observer         | 8.4.x    | [Linux](https://community.grafana.com/)             |         3000/31002           |              NA              |init-addon grafana|
| superset    | Analyzer         | 1.4.x    | [Linux](https://superset.apache.org//)              |         8088/31003           |              NA              |init-addon superset|

** Update 01/03/2022 **


**Optional**

| Name        | Type      | Version |  Packages  |
| ------      | ------    | ------  | ------      |
| Docker      | Container-based virtualization | 20.10   | [redhat](https://docs.docker.com/install/linux/docker-ee/rhel/), [openSUSE/SUSE](https://docs.docker.com/install/linux/docker-ee/suse/), [centos](https://docs.docker.com/install/linux/docker-ce/centos/), [debian](https://docs.docker.com/install/linux/docker-ce/debian/), [fedora](https://docs.docker.com/install/linux/docker-ce/fedora/), [ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) |
| OVN         | Network  | 1.9.x    | [Linux](https://github.com/alauda/kube-ovn)     |          
| Flannel     | Network  | 0.16.3   | [Linux](https://github.com/flannel-io/flannel/) |
## Structure

```
kubeinst: main install file
-- init.sh: initialize kubernetes master node.
-- join.sh: initialize kubernetes node node.
```

## Install

download the `kubeinst` tool.

```
curl --url https://raw.githubusercontent.com/kubesys/installer/master/kubeinst --output /usr/bin/kubeinst

chmod 777 /usr/bin/kubeinst
```

## Commands

```
kubeinst init-env container
kubeinst init-kube container
kubeinst init-cni calico
kubeinst init-addon prometheus
```

Now it support two commands

```
Commands:
  init-env             :(Init): download conatiner-based or vm-based software packages
  init-kube            :(Init): install kubernetes-based cluster for container or vm"
  init-cni             :(Init): install kubernetes-based cluster network, such as calico or kubeovn
  init-addon           :(Init): install kubernetes addons, such as loki, prometheus, grafana and superset
```

- Using the `init-env` command, you can install Docker and Kubernetes on a just installed OS.
- Using the `init-kube` commnad, you can install kubernetes as your want

```
kubeinst init-env    # (required)
kubeinst init-kube   # (required)
kubeinst init-cni    # (required)
kubeinst init-addon  # (optinal)
```

Note that you can customized :

- /etc/kubernetes/kubeadm.yaml： how to install Kubernetes
- /etc/kubernetes/kubeenv.list: which plugins should be installed


## Port Info

## 1. DevOps tools

### 1.1 Dev tools

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| theia       | object-oriented ide  |  next    | [Linux](https://theia-ide.org/docs/)                         |  31011       |
| jupyter     | data-oriented  ide   | latest  | [Linux](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html),[Chinese](https://www.cnblogs.com/zeryter/p/11331811.html)                                                              |  31012       |
| gitlab      | code repository      | latest  | [Linux](https://hub.docker.com/r/gitlab/gitlab-ce)            |  31013       |
| sonar       | quality manager |  sonarqube:8.6.0-community  | [Linux](https://docs.sonarqube.org/latest/)    |  31014       |
| kanboard    | task manager   |  kanboard/kanboard:v1.2.8  | [Linux](https://github.com/kanboard/kanboard)    |  31015       |
| nexus3      | jar repository       | 3.29.0  | [Linux](https://hub.docker.com/r/sonatype/nexus3)             |  31016       |
| jenkins     | full pipeline   |  jenkins:2.263.1-lts-centos  | [Linux](https://www.jenkins.io)               |  31017       |


### 1.2 Ops tools


| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |      
| kube-eventer| alert                | 1.2.0   | [Linux](https://github.com/AliyunContainerService/kube-eventer)      |   NA       |


## 2. Runtime

### 2.1 Compute

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| OpenKruise  | component-based      | 0.7.0   | [Linux](https://openkruise.io/en-us/docs/quick_start.html)   |       NA           |              
| kubeless    | function-based       | 1.0.7   | [Linux](https://kubeless.io/docs/quick-start/)      |   NA       |
| istio       | service-based        | 1.8.1   | [Linux](https://istio.io/latest/docs/setup/getting-started/)      |   NA       |
| volcano     | analysis-based       | 1.1.0   | [Linux](https://github.com/volcano-sh/volcano)      |   NA       |


### 2.2 Storage

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| registry    | distribution         | latest  | [Linux](https://github.com/distribution/distribution)         |  31031      |
| vsftpd      | distribution         | latest  | [Linux](https://help.ubuntu.com/community/vsftpd)             |  31032      |

## Roadmap

```
- 2.x: product ready
  - 2.0: support amd64 and arm64
  - 2.1: calico/kubeovn
```

## Useage

```
crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep kube | grep -v pause
kubectl proxy --address=0.0.0.0 --port=31888 --accept-hosts=
39.106.40.190
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes [node] node-role.kubernetes.io/master=true:NoSchedule
```
