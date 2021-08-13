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

## Command

```
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

```
kubeinst init-env [containerd/docker]
kubeinst init-kube
```

Note that you can customized :

- /etc/kubernetes/kubeadm.yaml： how to install Kubernetes
- /etc/kubernetes/kubeenv.list: which plugins should be installed

## Roadmap

```
- Prototype
  - 0.6: use kube-ovn
```

## Useage

```
crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep kube | grep -v pause
kubectl proxy --address=0.0.0.0 --port=31888 --accept-hosts=
39.106.40.190
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes [node] node-role.kubernetes.io/master=true:NoSchedule
```
