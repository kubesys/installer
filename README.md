## kube-installer

Install Kubernetes-based systems with a simple and comprehensible way.
Now this script can only work on CentOS/RHEL 7.x.

## Architecture

Our installer is used in a shell - bare metal machine way. Its framework is shown as below:

![framework](./others/framework.jpg)

## Matrix


| Name        | Type      | Version |  Packages  |   
| ------      | ------    | ------  | ------      |
| Docker      | Container-based virtualization | 20.10   | [redhat](https://docs.docker.com/install/linux/docker-ee/rhel/), [openSUSE/SUSE](https://docs.docker.com/install/linux/docker-ee/suse/), [centos](https://docs.docker.com/install/linux/docker-ce/centos/), [debian](https://docs.docker.com/install/linux/docker-ce/debian/), [fedora](https://docs.docker.com/install/linux/docker-ce/fedora/), [ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) |
| Kubernetes  | Virtual compute resource pool  | 1.20.6  | [Linux](https://docs.kubernetes.io/) |
| OVN         | Network solution        | 1.6.2 | [Linux](https://github.com/alauda/kube-ovn) |

**Optional**

| Name        | Type      | Version |  Packages  |
| ------      | ------    | ------  | ------      |
| Containerd  | Container-based virtualization | 1.3.9   |[Linux](https://containerd.io/docs/getting-started/)|
| Calico      | Network solution        | 3.19  | [Linux](https://docs.projectcalico.org/v3.17/getting-started/kubernetes/) |

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
kubeinst init-env
kubeinst init-kube
kubeinst init-backend
kubeinst init-frontend
kubeinst init-kvm-env
```

Now it support two commands

```
Commands:
  init-env       :	(Init): simplify configuring node, such as disable selinux, install docker
  init-kube      :	(Init): deploy Kubernetes as your want
  init-backend   :  (Init): install backend services"
  init-frontend  :  (Init): install dashboard (current only install all required files by frontend)"
  init-kvm-env   :  (Init): deploy qemu-kvm and libvirt
```

- Using the `init-env` command, you can install Docker and Kubernetes on a just installed OS.
- Using the `init-kube` commnad, you can install kubernetes as your want

```
kubeinst init-env 
kubeinst init-kube
kubeinst init-backend   
kubeinst init-frontend  
```

Note that you can customized :

- /etc/kubernetes/kubeadm.yaml： how to install Kubernetes
- /etc/kubernetes/kubeenv.list: which plugins should be installed


## Port Info

## 1. Tools

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| helm        | Package Mgr          | 3.5.2   | [Linux](https://helm.sh/docs/intro/quickstart/)      |                 NA           |
| kind        | Kubernetes IN Docker | 0.10.0   | [Linux](https://github.com/kubernetes-sigs/kind)    |                 NA           |
| krew        | Find and install kubectl plugins | 0.10.0   | [Linux](https://github.com/kubernetes-sigs/kind)    |                 NA           |

## 2. DevOps tools

### 2.1 Dev tools

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| theia       | object-oriented ide  |  next    | [Linux](https://theia-ide.org/docs/)                         |  31011       |
| jupyter     | data-oriented  ide   | latest  | [Linux](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html),[Chinese](https://www.cnblogs.com/zeryter/p/11331811.html)                                                              |  31012       |
| nexus3      | jar repository       | 3.29.0  | [Linux](https://hub.docker.com/r/sonatype/nexus3)             |  31021       |
| gitlab      | code repository      | latest  | [Linux](https://hub.docker.com/r/gitlab/gitlab-ce)            |  31022       |
| jenkins     | full pipeline   |  jenkins:2.263.1-lts-centos  | [Linux](https://www.jenkins.io)               |  31023       |
| sonar       | quality manager |  sonarqube:8.6.0-community  | [Linux](https://docs.sonarqube.org/latest/)    |  31024       |
| kanboard    | task manager   |  kanboard/kanboard:v1.2.8  | [Linux](https://github.com/kanboard/kanboard)    |  31025       |



### 2.2 Ops tools


| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |      
| kube-eventer| alert                | 1.2.0   | [Linux](https://github.com/AliyunContainerService/kube-eventer)      |   NA       |
| Loki        | log                  | 1.6.1   | [Linux](https://grafana.com/oss/loki/)             |            NA                |
| Prometheus  | utilization          | 2.23.0  | [Linux](https://github.com/prometheus/prometheus/) |           31001              |    
| grafana     | Dashboard            | 7.3.4   | [Linux](https://community.grafana.com/)            |           31002              |
| superset    | Dashboard            | 1.0.0   | [Linux](https://superset.apache.org//)             |           31003             |


## 3. Runtime

### 3.1 Compute

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| OpenKruise  | component-based      | 0.7.0   | [Linux](https://openkruise.io/en-us/docs/quick_start.html)   |       NA           |              
| kubeless    | function-based       | 1.0.7   | [Linux](https://kubeless.io/docs/quick-start/)      |   NA       |
| istio       | service-based        | 1.8.1   | [Linux](https://istio.io/latest/docs/setup/getting-started/)      |   NA       |
| volcano     | analysis-based       | 1.1.0   | [Linux](https://github.com/volcano-sh/volcano)      |   NA       |


### 3.3 Storage

| Name        | Type      | Version |  Packages  |   Port |
| ------      | ------    | ------  | ------      | ------ |
| registry    | distribution         | latest  | [Linux](https://github.com/distribution/distribution)         |  31031      |
| vsftpd      | distribution         | latest  | [Linux](https://help.ubuntu.com/community/vsftpd)             |  31032      |

## Roadmap

```
- 1.x: POC ready
  - 1.1: support containerd
  - 1.2: support init-kvm-env
  - 1.3: support init-backend
  - 1.4: support init-frontend
```

## Useage

```
crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep kube | grep -v pause
kubectl proxy --address=0.0.0.0 --port=31888 --accept-hosts=
39.106.40.190
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes [node] node-role.kubernetes.io/master=true:NoSchedule
```
