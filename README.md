## installer

Install Kubernetes and containerized software with a simple and comprehensible way.

** Note **
- work well on CentOS/RHEL 7.x/8.x and Ubuntu 18.x/20.x.
- support amd64 (such as intel, amd) and arm64 (such as phytium, kunpeng). 
- for Kubernetes >= 1.24

## Supported

- ShanDong Provincial Key Research and Development Program, China (2021CXGC010101)

## Authors

- wuheng@iscsa.ac.cn
- wuyuewen@iscas.ac.cn
- zhujianxing21@otcaix.iscas.ac.cn
- guohao21@otcaix.iscas.ac.cn

## Quick start

```
curl --url https://raw.githubusercontent.com/kubesys/installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

### Kubernetes container

1. Requried

```
kubeinst init-env ctr
kubeinst init-compute ctr
kubeinst init-network kube-ovn
kubeinst init-storage ceph
```

2. optional

### Kubernetes VM

Experimental.
After install Kubernetes container, you can install [VM](https://github.com/KubeVMMgr/kube-vm) on your cluster

```
kubeinst init-env vm
kubeinst init-compute vm
```

## Software

- [Kube](docs/kube.md)
- [devops](docs/devops.md)
- [addon](docs/addon.md)
- [stack](docs/stack.md)
- [yamls](https://gitee.com/syswu/yamls)


## Roadmap

```
- 2.3: support devops
- 2.4: support stack
```
