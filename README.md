## installer

Install Kubernetes and containerized software with a simple and comprehensible way.

** Note **
- OS 
  - CentOS/RHEL >= 7.5
  - Ubuntu >= 22.04
  - openEuler >= 23.09
- CPU 
  - amd64 (such as intel, AMD)
  - arm64 (such as phytium, kunpeng), 
  - risc-v 
- for Kubernetes >= 1.24

## Supported

- ShanDong Provincial Key Research and Development Program, China (2021CXGC010101)
- National Key Research and Development Program of China (2023YFB3308702)

## Authors

- wuheng@iscsa.ac.cn
- wuyuewen@iscas.ac.cn
- zhujianxing21@otcaix.iscas.ac.cn
- guohao21@otcaix.iscas.ac.cn

## Quick start


** Note **: using user 'root'
 
```
curl --url https://raw.githubusercontent.com/kubesys/installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
kubeinst init-osenv
kubeinst init-runtime containerd
kubeinst init-compute kubernetes
kubeinst init-network kubeovn
```

### Optional(kubevm)

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
- [yamls](https://gitee.com/syswu/yamls)

## Command

```
crictl --runtime-endpoint /run/containerd/containerd.sock ps -a | grep kube | grep -v pause
kubectl proxy --address=0.0.0.0 --port=31888 --accept-hosts=
39.106.40.190
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes [node] node-role.kubernetes.io/master=true:NoSchedule
```

## More

- https://kubernetes.io/docs/reference/config-api/kubeadm-config.v1beta3/
- https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/
- https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/
- https://github.com/Mirantis/cri-dockerd
## Roadmap

```
- 2.4: support docker
- 2.5: support cluster HA (Kube, OVN and Ceph)
```
