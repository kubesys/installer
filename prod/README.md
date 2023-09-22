## step by step

### 1. Enviroment

| Name | IP | Role |
| ---  | -- | ---- |
| master1 | 192.168.42.139 | master |
| master1 | 192.168.42.140 | master |
| master1 | 192.168.42.141 | master |
| work1   | 192.168.42.142 | worker |
|  VIP    | 192.168.42.160 |  ----  |

VIP is shared by three master nodes.

### 2. install kubeinst

Execute the following commands on each nodes.

```
curl --url https://raw.githubusercontent.com/kubesys/installer/master/kubeinst --output /usr/bin/kubeinst
chmod 777 /usr/bin/kubeinst
kubeinst init-env ctr
```

### 3. install KeepAlived

on master1 
```
docker run -d \
--name keepalived \
--restart=always \
--net=host \
-e KEEPALIVED_INTERFACE="ens33" \
-e KEEPALIVED_PRIORITY=100 \
-e KEEPALIVED_UNICAST_PEERS="#PYTHON2BASH:['192.168.42.139', '192.168.42.140','192.168.42.141']" \
-e KEEPALIVED_VIRTUAL_IPS="192.168.42.160" \
-e KEEPALIVED_STATE="MASTER" \
--privileged=true \
osixia/keepalived --loglevel debug
```

on master2 and master3
```
docker run -d \
--name keepalived \
--restart=always \
--net=host \
-e KEEPALIVED_INTERFACE="ens33" \
-e KEEPALIVED_PRIORITY=100 \
-e KEEPALIVED_UNICAST_PEERS="#PYTHON2BASH:['192.168.42.139', '192.168.42.140','192.168.42.141']" \
-e KEEPALIVED_VIRTUAL_IPS="192.168.42.160" \
-e KEEPALIVED_STATE="BACKUP" \
--privileged=true \
osixia/keepalived --loglevel debug
```
