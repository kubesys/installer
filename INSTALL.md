## Usage

- [istio](#istio)


## istio

### 1.1 prepare
```
version="1.12.2"
arch="amd64"
wget https://github.com/istio/istio/releases/download/$version/istio-$version-linux-$arch.tar.gz
tar zxvf istio-$version-linux-$arch.tar.gz
cd istio-$version/bin
```

### 1.2 install

```
istioctl install -y
```

### 1.3 uninstall

```
istioctl manifest generate | kubectl delete -f -
```
