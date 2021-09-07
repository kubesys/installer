## Usage

- [istio](#istio)
- [keptn](#keptn)
- [superset](#superset)


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

## keptn

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
version="0.9.0"
arch="amd64"
wget https://github.com/keptn/keptn/releases/download/$version/keptn-$version-linux-$arch.tar.gz
tar zxvf keptn-$version-linux-$arch.tar.gz
cd keptn-$version/bin
```

### 1.2 install

```
keptn install --platform=kubernetes --endpoint-service-type=NodePort --use-case=continuous-delivery -y
```

### 1.3 uninstall

```
keptn uninstall -y
```


## superset

```
docker build . -t registry.cn-beijing.aliyuncs.com/dosproj/superset:v$version-$arch
```
