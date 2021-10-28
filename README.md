## kube-installer

Install Kubernetes-based systems with a simple and comprehensible way.
** Note **
- this script can work well on CentOS/RHEL 7.x and Ubuntu 16.x/18.x.
- we test this script on Kubernetes >=1.16 and < 1.22


## Architecture

Our installer is used in a shell - bare metal machine way. Its framework is shown as below:

![framework](./others/framework.jpg)

## Matrix


| Name        | Type      | Version |  Packages   |  Ports    |     DNS   |
| ------      | ------    | ------  | ------      |   -----   |    -----  |
| Containerd  | Container        | 1.4.9    | [Linux](https://containerd.io/docs/getting-started/)|            NA                |              NA              |
| Kubernetes  | Orchestrator     | 1.22.2   | [Linux](https://docs.kubernetes.io/)                | 6443,12500,12501,30000-32000 |              NA              |           
| OVN         | SDNController    | 1.8.0    | [Linux](https://github.com/alauda/kube-ovn)         |            NA                |              NA              |
| Loki        | LogCollector     | 1.6.1    | [Linux](https://grafana.com/oss/loki/)              |            NA                |              NA              |  
| KeyCloack   | Authentication   | 15.0.2   | [Linux](https://www.keycloak.org/)                  |           31000              |              NA              |
| Prometheus  | Monitor          | 2.23.0   | [Linux](https://github.com/prometheus/prometheus/)  |           31001              |              NA              |
| grafana     | StateObserver    | 7.3.4    | [Linux](https://community.grafana.com/)             |           31002              |              NA              |
| superset    | StateAnalyzer    | 1.0.0    | [Linux](https://superset.apache.org//)              |           31003              |              NA              |
| Helm        | PackageManager   | 3.7.0    | [Linux](https://helm.sh/docs/intro/quickstart/)     |         8080/31004           |    charts-server.kube-repo   |
| Registry    | ImageManager     | 2.7.1    | [Linux](https://helm.sh/docs/intro/quickstart/)     |         5000/31005           |      oci-server.kube-repo    |

** Update 25/09/2021 **


**Optional**

| Name        | Type      | Version |  Packages  |
| ------      | ------    | ------  | ------      |
| Docker      | Container-based virtualization | 20.10   | [redhat](https://docs.docker.com/install/linux/docker-ee/rhel/), [openSUSE/SUSE](https://docs.docker.com/install/linux/docker-ee/suse/), [centos](https://docs.docker.com/install/linux/docker-ce/centos/), [debian](https://docs.docker.com/install/linux/docker-ce/debian/), [fedora](https://docs.docker.com/install/linux/docker-ce/fedora/), [ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) |
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
curl --url https://gitee.com/syswu/kube-installer/raw/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

or copy from the gitee registory.

```
rm -rf kube-installer
git clone https://gitee.com/Xuyuanjia2014/kube-installer.git
cd kube-installer
cp kubeinst /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

## Commands

```
kubeinst init-env
kubeinst init-kube
kubeinst init-cni
kubeinst init-addon
```

Now it support two commands

```
Commands:
  init-env             :(Init): install conatiner/docker, kubeadm, kubelet, kubectl and helm
  init-kube            :(Init): initialize kubernetes and deploy dex openldap
  init-cni             :(Init): deploy calico or kubeovn
  init-addon           :(Init): deploy loki, prometheus, grafana and superset
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
- 1.x: POC ready
  - 1.1: support containerd
  - 1.2: support init-kvm-env
  - 1.3: support init-backend
  - 1.4: support init-frontend
  - 1.5: support common for backend and frontend
  - 1.6: support message in backend
  - 1.7: support init-cni and inst-addon
  - 1.8: support inst-anth, and enable superset
```

## Useage

```
crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep kube | grep -v pause
kubectl proxy --address=0.0.0.0 --port=31888 --accept-hosts=
39.106.40.190
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes [node] node-role.kubernetes.io/master=true:NoSchedule
```
