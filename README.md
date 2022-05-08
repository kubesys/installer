## installer

Install Kubernetes and containerized software with a simple and comprehensible way.

** Note **
- work well on CentOS/RHEL 7.x/8.x and Ubuntu 18.x/20.x.
- support amd64 (such as intel, amd) and arm64 (such as phytium, kunpeng). 
- for Kubernetes >= 1.18

## Supported

- ShanDong Provincial Key Research and Development Program, China (2021CXGC010101)

## Authors

- wuheng@otcaix.iscsa.ac.cn
- wuyuewen@otcaix.iscas.ac.cn

## Quick start

```
curl --url https://raw.githubusercontent.com/kubesys/installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
```

### Kubernetes container

```
kubeinst init-env container
kubeinst init-compute container
kubeinst init-network calico
kubeinst init-storage postgres
```

### Kubernetes VM

Experimental.
After install Kubernetes container, you can install [VM](https://github.com/KubeVMMgr/kube-vm) on your cluster

```
kubeinst init-env vm
kubeinst init-compute vm
```

## Software

- [Kubernetes](docs/kube.md)
- [devops](docs/devops.md)
- [addon](docs/addon.md)


## Roadmap

```
- 2.x: product ready
  - 2.0: support VM
  - 2.1: support devops tools
  - 2.2: support dashboard
```
