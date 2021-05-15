## Project

Project: https://github.com/kubeovn/kube-ovn

## Useage

```
          args:
            - --default-cidr=10.16.0.0/16
            - --default-exclude-ips=
            - --node-switch-cidr=100.64.0.0/16
            - --network-type=geneve
            - --default-interface-name=
            - --default-vlan-id=100
```

replace 10.16.0.0/16 with $pod_cidr

```
          args:
            - --default-cidr=$pod_cidr
            - --default-exclude-ips=
            - --node-switch-cidr=100.64.0.0/16
            - --network-type=geneve
            - --default-interface-name=
            - --default-vlan-id=100
```

## Script

```
function download-ovn()
{
  wget https://raw.githubusercontent.com/kubeovn/kube-ovn/${ovn_version}/yamls/crd.yaml
  wget https://raw.githubusercontent.com/kubeovn/kube-ovn/${ovn_version}/yamls/ovn.yaml
  wget https://raw.githubusercontent.com/kubeovn/kube-ovn/${ovn_version}/yamls/kube-ovn.yaml
}

  kubectl label node $(hostname) kube-ovn/role=master
  kubectl apply -f crd.yaml
  ip=$(ifconfig eth0 | grep inet | head -1 | awk '{print$2}')
  sed -i "s/\$addresses/$ip/g" ovn.yaml
  kubectl apply -f ovn.yaml
  sed -i "s/\$pod_cidr/${kube_pod_subnet/\//\\/}/g" kube-ovn.yaml
  kubectl apply -f kube-ovn.yaml

```
