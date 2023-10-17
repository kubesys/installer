# 文档简介

	本文档用于测试用例的生成.
# 1 VirtualMachine

虚拟机是指安装了OS的磁盘.VirtualMachine所有操作的返回值一样，见**[返回值]**

## 1.1 CreateAndStartVMFromISO(通过ISO装虚拟机)

### 1 正常参数

**请求参数**

{
  "graphics" : "vnc,listen=0.0.0.0,password=abcdefg",
  "disk" : "/var/lib/libvirt/images/test3.qcow2,read_bytes_sec=1024000000,write_bytes_sec=1024000000 --disk /opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro",
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数graphics为空

**请求参数**

{
  "graphics" : null,
  "disk" : "/var/lib/libvirt/images/test3.qcow2,read_bytes_sec=1024000000,write_bytes_sec=1024000000 --disk /opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro",
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：<vnc/spice,listen=0.0.0.0>,password=xxx（<必填>，选填），密码为4-16位，是小写字母、数字和中划线组合"
}

### 3 参数disk为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "硬盘的约束：/var/lib/libvirt/images/test3.qcow2,target=hda,read_bytes_sec=1024000000,write_bytes_sec=1024000000，光驱的约束：/opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro，支持多个硬盘，第一个硬盘无需添加--disk，后续的需要"
}

### 4 参数memory为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：100~99999"
}

### 5 参数network为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "type=bridge（libvirt默认网桥virbr0）/ l2bridge（ovs网桥）/ l3bridge（支持ovn的ovs网桥），source=源网桥（必填），inbound=网络输入带宽QoS限制，单位为KiB，outbound=网络输出带宽QoS限制，单位为KiB，ip=IP地址（选填，只有type=l3bridge类型支持该参数），switch=ovn交换机名称（选填，只有type=l3bridge类型支持该参数），model=virtio/e1000/rtl8139（windows虚拟机），inbound=io入带宽，outbound=io出带宽，mac=mac地址（选填），参数顺序必须是type,source,ip,switch,model,inbound,outbound,mac"
}

### 6 参数os_variant为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "参考https://tower.im/teams/616100/repository_documents/3550/"
}

### 7 参数vcpus为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : null,
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "约束条件：最大vcpu数量=cpu核数×cpu插槽数×cpu线程数"
}

### 8 参数noautoconsole为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : null,
  "noautoconsole" : null
}

**返回值**

{
  "code": 200,
  "exception": "true"
}

## 1.2 CreateAndStartVMFromImage(通过镜像复制虚拟机)

### 9 正常参数

**请求参数**

{
  "graphics" : "vnc,listen=0.0.0.0,password=abcdefg",
  "disk" : "/var/lib/libvirt/images/test3.qcow2,read_bytes_sec=1024000000,write_bytes_sec=1024000000 --disk /opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro",
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 10 参数graphics为空

**请求参数**

{
  "graphics" : null,
  "disk" : "/var/lib/libvirt/images/test3.qcow2,read_bytes_sec=1024000000,write_bytes_sec=1024000000 --disk /opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro",
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：<vnc/spice,listen=0.0.0.0>,password=xxx（<必填>，选填），密码为4-16位，是小写字母、数字和中划线组合"
}

### 11 参数disk为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : "2048",
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "硬盘的约束：/var/lib/libvirt/images/test3.qcow2,target=hda,read_bytes_sec=1024000000,write_bytes_sec=1024000000，光驱的约束：/opt/ISO/CentOS-7-x86_64-Minimal-1511.iso,device=cdrom,perms=ro，支持多个硬盘，第一个硬盘无需添加--disk，后续的需要"
}

### 12 参数memory为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : "type=l3bridge,source=br-int,ip=192.168.5.9,switch=switch8888,model=e1000,inbound=102400,outbound=102400",
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：100~99999"
}

### 13 参数network为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : "centos7.0",
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "type=bridge（libvirt默认网桥virbr0）/ l2bridge（ovs网桥）/ l3bridge（支持ovn的ovs网桥），source=源网桥（必填），inbound=网络输入带宽QoS限制，单位为KiB，outbound=网络输出带宽QoS限制，单位为KiB，ip=IP地址（选填，只有type=l3bridge类型支持该参数），switch=ovn交换机名称（选填，只有type=l3bridge类型支持该参数），model=virtio/e1000/rtl8139（windows虚拟机），inbound=io入带宽，outbound=io出带宽，mac=mac地址（选填），参数顺序必须是type,source,ip,switch,model,inbound,outbound,mac"
}

### 14 参数os_variant为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : "2,cpuset=1-4,maxvcpus=40,cores=40,sockets=1,threads=1",
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "参考https://tower.im/teams/616100/repository_documents/3550/"
}

### 15 参数vcpus为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : null,
  "noautoconsole" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "约束条件：最大vcpu数量=cpu核数×cpu插槽数×cpu线程数"
}

### 16 参数noautoconsole为空

**请求参数**

{
  "graphics" : null,
  "disk" : null,
  "memory" : null,
  "network" : null,
  "os_variant" : null,
  "vcpus" : null,
  "noautoconsole" : null
}

**返回值**

{
  "code": 200,
  "exception": "true"
}

## 1.3 SuspendVM(暂停虚机)

### 17 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.4 StopVMForce(强制关机)

### 18 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.5 UnplugDevice(卸载设备)

### 19 正常参数

**请求参数**

{
  "file" : "/var/lib/libvirt/unplug.xml"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 20 参数file为空

**请求参数**

{
  "file" : null
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

## 1.6 UnplugNIC(卸载网卡)

### 21 正常参数

**请求参数**

{
  "type" : "true",
  "mac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 22 参数type为空

**请求参数**

{
  "type" : null,
  "mac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "只能取值bridge，l2bridge，l3bridge. brdige表示libvirt自定义交换机，但不支持设置mac和IP等；l2bridge是Ovs交换机，虚拟机或获得与当前物理机网络一样的IP，但不能动态指定；l3bridge是基于gre或vxlan的，可设置mac和IP等"
}

### 23 参数mac为空

**请求参数**

{
  "type" : null,
  "mac" : null
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

## 1.7 MigrateVM(虚机迁移)

### 24 正常参数

**请求参数**

{
  "ip" : "133.133.135.31"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 25 参数ip为空

**请求参数**

{
  "ip" : null
}

**返回值**

{
  "code": 200,
  "exception": "目标主机的服务url，主机之间需要提前配置免密登录"
}

## 1.8 MigrateVMDisk(虚机存储迁移)

### 26 正常参数

**请求参数**

{
  "ip" : "133.133.135.31",
  "migratedisks" : "disk=/var/lib/libvirt/cstor/pool1/pool1/disk1,pool=poolnfs1;disk=/var/lib/libvirt/cstor/pool2/pool2/disk2,pool=poolnfs2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 27 参数ip为空

**请求参数**

{
  "ip" : null,
  "migratedisks" : "disk=/var/lib/libvirt/cstor/pool1/pool1/disk1,pool=poolnfs1;disk=/var/lib/libvirt/cstor/pool2/pool2/disk2,pool=poolnfs2"
}

**返回值**

{
  "code": 200,
  "exception": "目标主机的服务url，主机之间需要提前配置免密登录"
}

### 28 参数migratedisks为空

**请求参数**

{
  "ip" : null,
  "migratedisks" : null
}

**返回值**

{
  "code": 200,
  "exception": "云主机存储迁移"
}

## 1.9 ChangeNumberOfCPU(CPU设置)

### 29 正常参数

**请求参数**

{
  "count" : "16"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 30 参数count为空

**请求参数**

{
  "count" : null
}

**返回值**

{
  "code": 200,
  "exception": "1-100个"
}

## 1.10 ResumeVM(恢复虚机)

### 31 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.11 PlugDisk(添加云盘)

### 32 正常参数

**请求参数**

{
  "source" : "/var/lib/libvirt/images/test1.qcow2",
  "target" : "vdc"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 33 参数source为空

**请求参数**

{
  "source" : null,
  "target" : "vdc"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 34 参数target为空

**请求参数**

{
  "source" : null,
  "target" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：vdX, hdX, sdX"
}

## 1.12 PlugDevice(添加设备)

### 35 正常参数

**请求参数**

{
  "file" : "/var/lib/libvirt/unplug.xml"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 36 参数file为空

**请求参数**

{
  "file" : null
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

## 1.13 ResetVM(强制重启)

### 37 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.14 UnplugDisk(卸载云盘)

### 38 正常参数

**请求参数**

{
  "target" : "windows: hdb, Linux: vdb"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 39 参数target为空

**请求参数**

{
  "target" : null
}

**返回值**

{
  "code": 200,
  "exception": "windows可适用hdx驱动，Linux可适用vdx驱动，x是指a,b,c,d可增长，但不能重名，disk具体是哪种target，以及适用了哪些target可以通过get方法获取进行分析"
}

## 1.15 StopVM(虚机关机)

### 40 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.16 StartVM(启动虚机)

### 41 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.17 DeleteVM(删除虚机)

### 42 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.18 RebootVM(虚机重启)

### 43 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.19 PlugNIC(添加网卡)

### 44 正常参数

**请求参数**

{
  "source" : "source=br-int,ip=192.168.5.2,switch=switch",
  "type" : "bridge",
  "mac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 45 参数source为空

**请求参数**

{
  "source" : null,
  "type" : "bridge",
  "mac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "source=源网桥（必填，默认为virbr0, br-native, br-int，以及用户自己创建的任何两层bridge名称），ip=IP地址（选填，只有type=l3bridge类型支持该参数），switch=ovn交换机名称（选填，只有type=l3bridge类型支持该参数）,顺序必须是source,ip,switch"
}

### 46 参数type为空

**请求参数**

{
  "source" : null,
  "type" : null,
  "mac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：bridge（libvirt默认网桥virbr0）, l2bridge（ovs网桥）, l3bridge（支持ovn的ovs网桥）"
}

### 47 参数mac为空

**请求参数**

{
  "source" : null,
  "type" : null,
  "mac" : null
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

## 1.20 ManageISO(插拔光驱)

### 48 正常参数

**请求参数**

{
  "path" : "vdc",
  "source" : "/var/lib/libvirt/target.iso",
  "eject" : "true",
  "insert" : "true",
  "update" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 49 参数path为空

**请求参数**

{
  "path" : null,
  "source" : "/var/lib/libvirt/target.iso",
  "eject" : "true",
  "insert" : "true",
  "update" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：vdX, hdX, sdX"
}

### 50 参数source为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : "true",
  "insert" : "true",
  "update" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 51 参数eject为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : null,
  "insert" : "true",
  "update" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 52 参数insert为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : null,
  "insert" : null,
  "update" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 53 参数update为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : null,
  "insert" : null,
  "update" : null,
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 54 参数force为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : null,
  "insert" : null,
  "update" : null,
  "force" : null,
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 55 参数block为空

**请求参数**

{
  "path" : null,
  "source" : null,
  "eject" : null,
  "insert" : null,
  "update" : null,
  "force" : null,
  "block" : null
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

## 1.21 UpdateOS(更换OS)

### 56 正常参数

**请求参数**

{
  "source" : "/var/lib/libvirt/source.xml",
  "target" : "/var/lib/libvirt/target.xml"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 57 参数source为空

**请求参数**

{
  "source" : null,
  "target" : "/var/lib/libvirt/target.xml"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 58 参数target为空

**请求参数**

{
  "source" : null,
  "target" : null
}

**返回值**

{
  "code": 200,
  "exception": "路径是字符串类型，长度是2到64位，只允许数字、小写字母、中划线、以及圆点"
}

## 1.22 ConvertVMToImage(转化模板)

### 59 正常参数

**请求参数**

{
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 60 参数targetPool为空

**请求参数**

{
  "targetPool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

## 1.23 InsertISO(插入光驱)

### 61 正常参数

**请求参数**

{
  "path" : "/var/lib/libvirt/target.iso",
  "insert" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 62 参数path为空

**请求参数**

{
  "path" : null,
  "insert" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 63 参数insert为空

**请求参数**

{
  "path" : null,
  "insert" : null,
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 64 参数force为空

**请求参数**

{
  "path" : null,
  "insert" : null,
  "force" : null,
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 65 参数block为空

**请求参数**

{
  "path" : null,
  "insert" : null,
  "force" : null,
  "block" : null
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

## 1.24 EjectISO(拔出光驱)

### 66 正常参数

**请求参数**

{
  "path" : "/var/lib/libvirt/target.iso",
  "eject" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 67 参数path为空

**请求参数**

{
  "path" : null,
  "eject" : "true",
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 68 参数eject为空

**请求参数**

{
  "path" : null,
  "eject" : null,
  "force" : "true",
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 69 参数force为空

**请求参数**

{
  "path" : null,
  "eject" : null,
  "force" : null,
  "block" : "true"
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

### 70 参数block为空

**请求参数**

{
  "path" : null,
  "eject" : null,
  "force" : null,
  "block" : null
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

## 1.25 ResizeVM(调整磁盘)

### 71 正常参数

**请求参数**

{
  "path" : "/var/lib/libvirt/images/test1.qcow2",
  "size" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 72 参数path为空

**请求参数**

{
  "path" : null,
  "size" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 73 参数size为空

**请求参数**

{
  "path" : null,
  "size" : null
}

**返回值**

{
  "code": 200,
  "exception": "1000000-999999999999（单位：KiB）"
}

## 1.26 CloneVM(克隆虚机)

### 74 正常参数

**请求参数**

{
  "name" : "newvm"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 75 参数name为空

**请求参数**

{
  "name" : null
}

**返回值**

{
  "code": 200,
  "exception": "新虚拟机名长度是4到100位"
}

## 1.27 TuneDiskQoS(磁盘QoS)

### 76 正常参数

**请求参数**

{
  "device" : "vdc"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 77 参数device为空

**请求参数**

{
  "device" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：vdX, hdX, sdX"
}

## 1.28 TuneNICQoS(网卡QoS)

### 78 正常参数

**请求参数**

{
  "_interface" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 79 参数_interface为空

**请求参数**

{
  "_interface" : null
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

## 1.29 ResizeMaxRAM(设置虚拟机最大内存)

### 80 正常参数

**请求参数**

{
  "size" : "1GiB: 1048576"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 81 参数size为空

**请求参数**

{
  "size" : null
}

**返回值**

{
  "code": 200,
  "exception": "100MiB到100GiB"
}

## 1.30 SetBootOrder(启动顺序)

### 82 正常参数

**请求参数**

{
  "order" : "hda,vda"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 83 参数order为空

**请求参数**

{
  "order" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：vdX, hdX, sdX"
}

## 1.31 SetVncPassword(设置VNC密码)

### 84 正常参数

**请求参数**

{
  "password" : "abcdefg"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 85 参数password为空

**请求参数**

{
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：密码为4-16位，是小写字母、数字和中划线组合"
}

## 1.32 UnsetVncPassword(取消VNC密码)

### 86 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.33 SetGuestPassword(虚机密码)

### 87 正常参数

**请求参数**

{
  "os_type" : "linux",
  "user" : "root",
  "password" : "abcdefg"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 88 参数os_type为空

**请求参数**

{
  "os_type" : null,
  "user" : "root",
  "password" : "abcdefg"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：windows/linux"
}

### 89 参数user为空

**请求参数**

{
  "os_type" : null,
  "user" : null,
  "password" : "abcdefg"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 90 参数password为空

**请求参数**

{
  "os_type" : null,
  "user" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：密码为4-16位，是小写字母、数字和中划线组合"
}

## 1.34 InjectSshKey(虚机ssh key)

### 91 正常参数

**请求参数**

{
  "os_type" : "linux",
  "user" : "root",
  "ssh_key" : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9kyC1EUvxppNqYSr8mh8GIC9VBk0IdL7t+Y4dp5vcyKO+Qtx4W9mRdQ8aPuEVAxSfjDsbpfyW1O/cPUbCJJZR9Gg9FYL63V8Q97UN3V4i/ILUMTazF+MfN82ln80PQhCv0SQwfx9qsAmhmVvukPDESr2i2TO93SiY15dh1niX8AeptfXfAZWg+zJA5gIdov1u88IE1xIPjhytUCnGPJNW0kvqJzRsCSzDY7puYXO7mWRuDYpHV7VZp0qYX9urrQB+YPzIP3UBC6VbhpapRLtir8whzFCu0MKTXjzzE7h++DiTaqLMtQIfuXHKgMTA39wnQPuqnf7Q/hbm9qYMCauf root@node22"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 92 参数os_type为空

**请求参数**

{
  "os_type" : null,
  "user" : "root",
  "ssh_key" : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9kyC1EUvxppNqYSr8mh8GIC9VBk0IdL7t+Y4dp5vcyKO+Qtx4W9mRdQ8aPuEVAxSfjDsbpfyW1O/cPUbCJJZR9Gg9FYL63V8Q97UN3V4i/ILUMTazF+MfN82ln80PQhCv0SQwfx9qsAmhmVvukPDESr2i2TO93SiY15dh1niX8AeptfXfAZWg+zJA5gIdov1u88IE1xIPjhytUCnGPJNW0kvqJzRsCSzDY7puYXO7mWRuDYpHV7VZp0qYX9urrQB+YPzIP3UBC6VbhpapRLtir8whzFCu0MKTXjzzE7h++DiTaqLMtQIfuXHKgMTA39wnQPuqnf7Q/hbm9qYMCauf root@node22"
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：windows/linux"
}

### 93 参数user为空

**请求参数**

{
  "os_type" : null,
  "user" : null,
  "ssh_key" : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9kyC1EUvxppNqYSr8mh8GIC9VBk0IdL7t+Y4dp5vcyKO+Qtx4W9mRdQ8aPuEVAxSfjDsbpfyW1O/cPUbCJJZR9Gg9FYL63V8Q97UN3V4i/ILUMTazF+MfN82ln80PQhCv0SQwfx9qsAmhmVvukPDESr2i2TO93SiY15dh1niX8AeptfXfAZWg+zJA5gIdov1u88IE1xIPjhytUCnGPJNW0kvqJzRsCSzDY7puYXO7mWRuDYpHV7VZp0qYX9urrQB+YPzIP3UBC6VbhpapRLtir8whzFCu0MKTXjzzE7h++DiTaqLMtQIfuXHKgMTA39wnQPuqnf7Q/hbm9qYMCauf root@node22"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 94 参数ssh_key为空

**请求参数**

{
  "os_type" : null,
  "user" : null,
  "ssh_key" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：只允许数字、大小写字母、空格、-+/@"
}

## 1.35 ResizeRAM(内存扩容)

### 95 正常参数

**请求参数**

{
  "size" : "1GiB: 1048576"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 96 参数size为空

**请求参数**

{
  "size" : null
}

**返回值**

{
  "code": 200,
  "exception": "100MiB到100GiB"
}

## 1.36 BindFloatingIP(绑定浮动IP)

### 97 正常参数

**请求参数**

{
  "swName" : "switch11",
  "outSwName" : "switch11",
  "fip" : "192.168.5.2/24"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 98 参数swName为空

**请求参数**

{
  "swName" : null,
  "outSwName" : "switch11",
  "fip" : "192.168.5.2/24"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 99 参数outSwName为空

**请求参数**

{
  "swName" : null,
  "outSwName" : null,
  "fip" : "192.168.5.2/24"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 100 参数fip为空

**请求参数**

{
  "swName" : null,
  "outSwName" : null,
  "fip" : null
}

**返回值**

{
  "code": 200,
  "exception": "x.x.x.x,x取值范围0到255"
}

## 1.37 UnbindFloatingIP(解绑浮动IP)

### 101 正常参数

**请求参数**

{
  "swName" : "switch11",
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "fip" : "192.168.5.2",
  "vmip" : "192.168.5.2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 102 参数swName为空

**请求参数**

{
  "swName" : null,
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "fip" : "192.168.5.2",
  "vmip" : "192.168.5.2"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 103 参数vmmac为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "fip" : "192.168.5.2",
  "vmip" : "192.168.5.2"
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

### 104 参数fip为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "fip" : null,
  "vmip" : "192.168.5.2"
}

**返回值**

{
  "code": 200,
  "exception": "x.x.x.x,x取值范围0到255"
}

### 105 参数vmip为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "fip" : null,
  "vmip" : null
}

**返回值**

{
  "code": 200,
  "exception": "x.x.x.x,x取值范围0到255"
}

## 1.38 AddACL(创建安全组)

### 106 正常参数

**请求参数**

{
  "swName" : "switch11",
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 107 参数swName为空

**请求参数**

{
  "swName" : null,
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 108 参数vmmac为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

### 109 参数type为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "from或者to"
}

### 110 参数rule为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : null,
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "&&连接两个规则，注意src和dst后==前后必须有一个空格"
}

### 111 参数operator为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : null,
  "operator" : null
}

**返回值**

{
  "code": 200,
  "exception": "allow或者drop"
}

## 1.39 ModifyACL(修改安全组)

### 112 正常参数

**请求参数**

{
  "swName" : "switch11",
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 113 参数swName为空

**请求参数**

{
  "swName" : null,
  "vmmac" : "7e:0c:b0:ef:6a:04",
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 114 参数vmmac为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : "from",
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

### 115 参数type为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : "ip4.src == $dmz && tcp.dst == 3306",
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "from或者to"
}

### 116 参数rule为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : null,
  "operator" : "allow"
}

**返回值**

{
  "code": 200,
  "exception": "&&连接两个规则，注意src和dst后==前后必须有一个空格"
}

### 117 参数operator为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null,
  "type" : null,
  "rule" : null,
  "operator" : null
}

**返回值**

{
  "code": 200,
  "exception": "allow或者drop"
}

## 1.40 DeprecatedACL(删除安全组)

### 118 正常参数

**请求参数**

{
  "swName" : "switch11",
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 119 参数swName为空

**请求参数**

{
  "swName" : null,
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是4到100位，只允许数字、小写字母、中划线、以及圆点"
}

### 120 参数vmmac为空

**请求参数**

{
  "swName" : null,
  "vmmac" : null
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

## 1.41 BatchDeprecatedACL(批量删除安全组)

### 121 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 1.42 SetQoS(设置QoS)

### 122 正常参数

**请求参数**

{
  "swName" : "switch1",
  "type" : "from",
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 123 参数swName为空

**请求参数**

{
  "swName" : null,
  "type" : "from",
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "交换机名"
}

### 124 参数type为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "from或者to"
}

### 125 参数rule为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "只能是ip, ip4, icmp之类"
}

### 126 参数rate为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : null,
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "单位是kbps, 0-1000Mbps"
}

### 127 参数burst为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : null,
  "burst" : null
}

**返回值**

{
  "code": 200,
  "exception": "单位是kbps, 0-100Mbps"
}

## 1.43 ModifyQoS(修改QoS)

### 128 正常参数

**请求参数**

{
  "swName" : "switch1",
  "type" : "from",
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 129 参数swName为空

**请求参数**

{
  "swName" : null,
  "type" : "from",
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "交换机名"
}

### 130 参数type为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : "ip",
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "from或者to"
}

### 131 参数rule为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : "10000",
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "只能是ip, ip4, icmp之类"
}

### 132 参数rate为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : null,
  "burst" : "100"
}

**返回值**

{
  "code": 200,
  "exception": "单位是kbps, 0-1000Mbps"
}

### 133 参数burst为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "rate" : null,
  "burst" : null
}

**返回值**

{
  "code": 200,
  "exception": "单位是kbps, 0-100Mbps"
}

## 1.44 UnsetQoS(删除QoS)

### 134 正常参数

**请求参数**

{
  "swName" : "switch1",
  "type" : "from",
  "rule" : "ip",
  "priority" : "2",
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 135 参数swName为空

**请求参数**

{
  "swName" : null,
  "type" : "from",
  "rule" : "ip",
  "priority" : "2",
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "交换机名"
}

### 136 参数type为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : "ip",
  "priority" : "2",
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "from或者to"
}

### 137 参数rule为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "priority" : "2",
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "只能是ip, ip4, icmp之类"
}

### 138 参数priority为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "priority" : null,
  "vmmac" : "7e:0c:b0:ef:6a:04"
}

**返回值**

{
  "code": 200,
  "exception": "0-32767"
}

### 139 参数vmmac为空

**请求参数**

{
  "swName" : null,
  "type" : null,
  "rule" : null,
  "priority" : null,
  "vmmac" : null
}

**返回值**

{
  "code": 200,
  "exception": "虚拟机的mac地址"
}

## 1.45 ExportVM(导出虚拟机)

### 140 正常参数

**请求参数**

{
  "path" : "from"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 141 参数path为空

**请求参数**

{
  "path" : null
}

**返回值**

{
  "code": 200,
  "exception": "/root"
}

## 1.46 BackupVM(备份虚拟机)

### 142 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 143 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 144 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 1.47 RestoreVM(恢复虚拟机)

### 145 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 146 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 147 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 1.48 DeleteRemoteBackup(删除远程备份)

### 148 正常参数

**请求参数**

{
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 149 参数version为空

**请求参数**

{
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 1.49 PullRemoteBackup(拉取远程备份)

### 150 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 151 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "拉取备份后使用的存储池"
}

### 152 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

### 153 参数remote为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 154 参数port为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 155 参数username为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 156 参数password为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

## 1.50 PushRemoteBackup(上传备份)

### 157 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 158 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份使用的存储池"
}

### 159 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

### 160 参数remote为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 161 参数port为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 162 参数username为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 163 参数password为空

**请求参数**

{
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

## 1.51 DeleteVMBackup(删除本地备份)

### 164 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 165 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 166 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 1.52 PassthroughDevice(设备透传)

### 167 正常参数

**请求参数**

{
  "action" : "add",
  "bus_num" : "01",
  "sub_bus_num" : "00",
  "dev_num" : "0",
  "dev_type" : "pci"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 168 参数action为空

**请求参数**

{
  "action" : null,
  "bus_num" : "01",
  "sub_bus_num" : "00",
  "dev_num" : "0",
  "dev_type" : "pci"
}

**返回值**

{
  "code": 200,
  "exception": "添加或删除：add/remove"
}

### 169 参数bus_num为空

**请求参数**

{
  "action" : null,
  "bus_num" : null,
  "sub_bus_num" : "00",
  "dev_num" : "0",
  "dev_type" : "pci"
}

**返回值**

{
  "code": 200,
  "exception": "用lsusb/lspci命令查询的bus号"
}

### 170 参数sub_bus_num为空

**请求参数**

{
  "action" : null,
  "bus_num" : null,
  "sub_bus_num" : null,
  "dev_num" : "0",
  "dev_type" : "pci"
}

**返回值**

{
  "code": 200,
  "exception": "用lsusb/lspci命令查询的副bus号"
}

### 171 参数dev_num为空

**请求参数**

{
  "action" : null,
  "bus_num" : null,
  "sub_bus_num" : null,
  "dev_num" : null,
  "dev_type" : "pci"
}

**返回值**

{
  "code": 200,
  "exception": "用lsusb/lspci命令查询的device号"
}

### 172 参数dev_type为空

**请求参数**

{
  "action" : null,
  "bus_num" : null,
  "sub_bus_num" : null,
  "dev_num" : null,
  "dev_type" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：usb/pci"
}

## 1.53 RedirectUsb(usb重定向，需搭配SPICE终端使用)

### 173 正常参数

**请求参数**

{
  "action" : "on"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 174 参数action为空

**请求参数**

{
  "action" : null
}

**返回值**

{
  "code": 200,
  "exception": "开启或关闭：on/off"
}

## 1.54 UpdateGraphic(更新虚拟机远程终端)

### 175 正常参数

**请求参数**

{
  "type" : "spice"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 176 参数type为空

**请求参数**

{
  "type" : null
}

**返回值**

{
  "code": 200,
  "exception": "取值范围：vnc/spice"
}

## 1.55 AutoStartVM(设置虚拟机高可用，对于正在运行的虚拟机重启后生效)

### 177 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

# 2 VirtualMachineImage

虚拟机模板，包括CPU、内存、OS等信息.VirtualMachineImage所有操作的返回值一样，见**[返回值]**

## 2.1 CreateImage(创建虚拟机镜像)

### 1 正常参数

**请求参数**

{
  "disk" : "/var/lib/libvirt/aaa.qcow2",
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数disk为空

**请求参数**

{
  "disk" : null,
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 3 参数targetPool为空

**请求参数**

{
  "disk" : null,
  "targetPool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

## 2.2 DeleteImage(删除虚拟机镜像)

### 4 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 2.3 ConvertImageToVM(将虚拟机镜像转化为虚拟机)

### 5 正常参数

**请求参数**

{
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 6 参数targetPool为空

**请求参数**

{
  "targetPool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

# 3 VirtualMachineDisk

云盘是指未格式化的云盘.VirtualMachineDisk所有操作的返回值一样，见**[返回值]**

## 3.1 DeleteDisk(删除云盘)

### 1 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，uus，nfs，glusterfs之一"
}

### 3 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null
}

**返回值**

{
  "code": 200,
  "exception": "已创建出的存储池"
}

## 3.2 ResizeDisk(调整云盘大小)

### 4 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 5 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "localfs，vdiskfs，nfs，glusterfs支持扩容，uus类型中dev和iscsi支持扩容，dev-fast和iscsi-fast不支持扩容"
}

### 6 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "已创建出的存储池"
}

### 7 参数capacity为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "capacity" : null
}

**返回值**

{
  "code": 200,
  "exception": "1000000000-999999999999（单位：Byte），需要比以前的云盘空间大"
}

## 3.3 CreateDisk(创建云盘)

### 8 正常参数

**请求参数**

{
  "type" : "localfs",
  "format" : "qcow2",
  "pool" : "pool2",
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 9 参数type为空

**请求参数**

{
  "type" : null,
  "format" : "qcow2",
  "pool" : "pool2",
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，uus，nfs，glusterfs之一"
}

### 10 参数format为空

**请求参数**

{
  "type" : null,
  "format" : null,
  "pool" : "pool2",
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "qcow2"
}

### 11 参数pool为空

**请求参数**

{
  "type" : null,
  "format" : null,
  "pool" : null,
  "capacity" : "‭10,737,418,240‬"
}

**返回值**

{
  "code": 200,
  "exception": "已创建出的存储池"
}

### 12 参数capacity为空

**请求参数**

{
  "type" : null,
  "format" : null,
  "pool" : null,
  "capacity" : null
}

**返回值**

{
  "code": 200,
  "exception": "1000000000-999999999999（单位：Byte）"
}

## 3.4 CreateDiskFromDiskImage(从镜像创建云盘)

### 13 正常参数

**请求参数**

{
  "type" : "localfs",
  "targetPool" : "pool2",
  "source" : "/var/lib/libvirt/test.qcow2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 14 参数type为空

**请求参数**

{
  "type" : null,
  "targetPool" : "pool2",
  "source" : "/var/lib/libvirt/test.qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，nfs，glusterfs之一"
}

### 15 参数targetPool为空

**请求参数**

{
  "type" : null,
  "targetPool" : null,
  "source" : "/var/lib/libvirt/test.qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 16 参数source为空

**请求参数**

{
  "type" : null,
  "targetPool" : null,
  "source" : null
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

## 3.5 CloneDisk(克隆云盘)

### 17 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "newname" : "newdisk",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 18 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "newname" : "newdisk",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs, vdiskfs，nfs，glusterfs之一"
}

### 19 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "newname" : "newdisk",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 20 参数newname为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "newname" : null,
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成"
}

### 21 参数format为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "newname" : null,
  "format" : null
}

**返回值**

{
  "code": 200,
  "exception": "qcow2"
}

## 3.6 MigrateDisk(迁移云盘)

### 22 正常参数

**请求参数**

{
  "pool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 23 参数pool为空

**请求参数**

{
  "pool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

## 3.7 CreateDiskInternalSnapshot(创建云盘内部快照)

### 24 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 25 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，nfs，glusterfs, vdiskfs之一"
}

### 26 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 27 参数snapshotname为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成"
}

## 3.8 RevertDiskInternalSnapshot(从云盘内部快照恢复)

### 28 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 29 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs, vdiskfs，nfs，glusterfs之一"
}

### 30 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 31 参数snapshotname为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成"
}

## 3.9 DeleteDiskInternalSnapshot(删除云盘内部快照)

### 32 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 33 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs, vdiskfs，nfs，glusterfs之一"
}

### 34 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : "snap1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 35 参数snapshotname为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "snapshotname" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成"
}

## 3.10 BackupDisk(备份云盘)

### 36 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 37 参数pool为空

**请求参数**

{
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 38 参数version为空

**请求参数**

{
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 3.11 CreateCloudInitUserDataImage(创建cloud-init的镜像文件)

### 39 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079",
  "userData" : ""
}

**返回值**

{
  "code": 200,
  "data": true
}

### 40 参数pool为空

**请求参数**

{
  "pool" : null,
  "userData" : ""
}

**返回值**

{
  "code": 200,
  "exception": "云盘使用的存储池"
}

### 41 参数userData为空

**请求参数**

{
  "pool" : null,
  "userData" : null
}

**返回值**

{
  "code": 200,
  "exception": "必须能转换成yaml格式"
}

## 3.12 DeleteCloudInitUserDataImage(删除cloud-init的镜像文件)

### 42 正常参数

**请求参数**

{
  "pool" : "61024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 43 参数pool为空

**请求参数**

{
  "pool" : null
}

**返回值**

{
  "code": 200,
  "exception": "云盘使用的存储池"
}

# 4 VirtualMachineDiskImage

云盘模板，主要是指大小和文件格式等.VirtualMachineDiskImage所有操作的返回值一样，见**[返回值]**

## 4.1 CreateDiskImageFromDisk(从云盘创建云盘镜像)

### 1 正常参数

**请求参数**

{
  "targetPool" : "pool2",
  "sourcePool" : "pool1",
  "sourceVolume" : "volume1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数targetPool为空

**请求参数**

{
  "targetPool" : null,
  "sourcePool" : "pool1",
  "sourceVolume" : "volume1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 3 参数sourcePool为空

**请求参数**

{
  "targetPool" : null,
  "sourcePool" : null,
  "sourceVolume" : "volume1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 4 参数sourceVolume为空

**请求参数**

{
  "targetPool" : null,
  "sourcePool" : null,
  "sourceVolume" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

## 4.2 CreateDiskImage(创建云盘镜像)

### 5 正常参数

**请求参数**

{
  "imageType" : "iso",
  "source" : "/var/lib/libvirt/test.qcow2",
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 6 参数imageType为空

**请求参数**

{
  "imageType" : null,
  "source" : "/var/lib/libvirt/test.qcow2",
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "exception": "iso or qcow2"
}

### 7 参数source为空

**请求参数**

{
  "imageType" : null,
  "source" : null,
  "targetPool" : "pool2"
}

**返回值**

{
  "code": 200,
  "exception": "路径必须在/var/lib/libvirt下，18-1024位，只允许小写、字母、中划线和圆点"
}

### 8 参数targetPool为空

**请求参数**

{
  "imageType" : null,
  "source" : null,
  "targetPool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

## 4.3 DeleteDiskImage(删除云盘镜像)

### 9 正常参数

**请求参数**

{
  "sourcePool" : "pool1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 10 参数sourcePool为空

**请求参数**

{
  "sourcePool" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

# 5 VirtualMachineDiskSnapshot

云盘快照是指云盘的外部快照，目前支持QCOW2格式.VirtualMachineDiskSnapshot所有操作的返回值一样，见**[返回值]**

## 5.1 CreateDiskExternalSnapshot(创建云盘外部快照)

### 1 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "format" : "qcow2",
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "format" : "qcow2",
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，nfs，glusterfs之一"
}

### 3 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "format" : "qcow2",
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池，只支持localfs、nfs和glusterfs类型"
}

### 4 参数format为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "format" : null,
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "exception": "qcow2"
}

### 5 参数vol为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "format" : null,
  "vol" : null
}

**返回值**

{
  "code": 200,
  "exception": "磁盘和快照"
}

## 5.2 RevertDiskExternalSnapshot(从云盘外部快照恢复)

### 6 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "vol" : "disk1",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 7 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "vol" : "disk1",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，nfs，glusterfs之一"
}

### 8 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "vol" : "disk1",
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 9 参数vol为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "vol" : null,
  "format" : "qcow2"
}

**返回值**

{
  "code": 200,
  "exception": "磁盘和快照"
}

### 10 参数format为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "vol" : null,
  "format" : null
}

**返回值**

{
  "code": 200,
  "exception": "qcow2"
}

## 5.3 DeleteDiskExternalSnapshot(删除云盘外部快照)

### 11 正常参数

**请求参数**

{
  "type" : "localfs",
  "pool" : "pool2",
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 12 参数type为空

**请求参数**

{
  "type" : null,
  "pool" : "pool2",
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "exception": "只能是localfs，vdiskfs，nfs，glusterfs之一"
}

### 13 参数pool为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "vol" : "disk1"
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已创建出的存储池"
}

### 14 参数vol为空

**请求参数**

{
  "type" : null,
  "pool" : null,
  "vol" : null
}

**返回值**

{
  "code": 200,
  "exception": "磁盘和快照"
}

# 6 VirtualMachineSnapshot

虚拟机/云盘快照.VirtualMachineSnapshot所有操作的返回值一样，见**[返回值]**

## 6.1 DeleteSnapshot(删除虚拟机和挂载到虚拟机的云盘快照)

### 1 正常参数

**请求参数**

{
  "domain" : "centos1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数domain为空

**请求参数**

{
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已存在的虚拟机名"
}

## 6.2 CreateSnapshot(创建虚拟机快照和挂载到虚拟机的云盘快照)

### 3 正常参数

**请求参数**

{
  "diskspec" : "只对系统盘做快照示例：vda,snapshot=external,file=/var/lib/libvirt/snapshots/snapshot1,drvier=qcow2 --diskspec vdb,snapshot=no",
  "domain" : "950646e8c17a49d0b83c1c797811e001"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 4 参数diskspec为空

**请求参数**

{
  "diskspec" : null,
  "domain" : "950646e8c17a49d0b83c1c797811e001"
}

**返回值**

{
  "code": 200,
  "exception": "vda(对哪个磁盘做快照，多个请参考示例),snapshot=external/internal/no(快照类型，支持external：外部,internal:内部,no:不做快照),file=/var/lib/libvirt/snapshots/snapshot1(快照文件的存放路径),drvier=qcow2（只支持qcow2）"
}

### 5 参数domain为空

**请求参数**

{
  "diskspec" : null,
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "已存在的虚拟机名，由4-100位的数字和小写字母组成"
}

## 6.3 RevertVirtualMachine(恢复成虚拟机和挂载到虚拟机的云盘快照)

### 6 正常参数

**请求参数**

{
  "domain" : "centos1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 7 参数domain为空

**请求参数**

{
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已存在的虚拟机名"
}

## 6.4 CopySnapshot(全拷贝快照到文件)

### 8 正常参数

**请求参数**

{
  "domain" : "centos1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 9 参数domain为空

**请求参数**

{
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已存在的虚拟机名"
}

## 6.5 MergeSnapshot(合并快照到叶子节点)

### 10 正常参数

**请求参数**

{
  "domain" : "centos1"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 11 参数domain为空

**请求参数**

{
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "由4-100位的数字和小写字母组成，已存在的虚拟机名"
}

# 7 VirtualMachinePool

扩展支持各种存储后端.VirtualMachinePool所有操作的返回值一样，见**[返回值]**

## 7.1 AutoStartPool(开机启动存储池)

### 1 正常参数

**请求参数**

{
  "disable" : "true"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数disable为空

**请求参数**

{
  "disable" : null
}

**返回值**

{
  "code": 200,
  "exception": "true或者false"
}

## 7.2 CreatePool(创建存储池)

### 3 正常参数

**请求参数**

{
  "type" : "dir",
  "content" : "vmd",
  "url" : "uus-iscsi-independent://admin:admin@192.168.3.10:7000/p1/4/2/0/32/0/3"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 4 参数type为空

**请求参数**

{
  "type" : null,
  "content" : "vmd",
  "url" : "uus-iscsi-independent://admin:admin@192.168.3.10:7000/p1/4/2/0/32/0/3"
}

**返回值**

{
  "code": 200,
  "exception": "只能是dir，uus，nfs，glusterfs, vdiskfs之一"
}

### 5 参数content为空

**请求参数**

{
  "type" : null,
  "content" : null,
  "url" : "uus-iscsi-independent://admin:admin@192.168.3.10:7000/p1/4/2/0/32/0/3"
}

**返回值**

{
  "code": 200,
  "exception": "只能是vmd，vmdi，iso之一"
}

### 6 参数url为空

**请求参数**

{
  "type" : null,
  "content" : null,
  "url" : null
}

**返回值**

{
  "code": 200,
  "exception": "建立云存储池时通过cstor-cli pool-list查询出的云存储池路径"
}

## 7.3 StartPool(启动存储池)

### 7 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 7.4 StopPool(停止存储池)

### 8 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 7.5 DeletePool(删除存储池)

### 9 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 7.6 ShowPool(查询存储池)

### 10 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 7.7 RestoreVMBackup(恢复虚拟机)

### 11 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 12 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份时使用云主机"
}

### 13 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 14 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 7.8 DeleteRemoteBackup(删除远程备份)

### 15 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 16 参数domain为空

**请求参数**

{
  "domain" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "要清理云主机或云盘的远程备份所在的云主机"
}

### 17 参数version为空

**请求参数**

{
  "domain" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 7.9 PullRemoteBackup(拉取远程备份)

### 18 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 19 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "要拉取云盘或云主机的远程备份所在的云主机"
}

### 20 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "拉取备份后使用的存储池"
}

### 21 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

### 22 参数remote为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 23 参数port为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 24 参数username为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 25 参数password为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

## 7.10 PushRemoteBackup(上传备份)

### 26 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 27 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "要推送的云主机或云盘备份所在的云主机"
}

### 28 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份使用的存储池"
}

### 29 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

### 30 参数remote为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 31 参数port为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 32 参数username为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 33 参数password为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

## 7.11 DeleteVMBackup(删除本地备份)

### 34 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 35 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "要删除备份记录所在的云主机"
}

### 36 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机使用的存储池"
}

### 37 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 7.12 CleanVMBackup(清理本地备份)

### 38 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 39 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "要清理云盘或云主机备份所在的云主机"
}

### 40 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null
}

**返回值**

{
  "code": 200,
  "exception": "云主机备份时使用的存储池"
}

## 7.13 CleanVMRemoteBackup(清理远端备份)

### 41 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 42 参数domain为空

**请求参数**

{
  "domain" : null,
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "要清理云盘的远程备份所在的云主机"
}

### 43 参数remote为空

**请求参数**

{
  "domain" : null,
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 44 参数port为空

**请求参数**

{
  "domain" : null,
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 45 参数username为空

**请求参数**

{
  "domain" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 46 参数password为空

**请求参数**

{
  "domain" : null,
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

## 7.14 ScanVMBackup(扫描本地备份)

### 47 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 48 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "要扫描云盘的备份所在的云主机"
}

### 49 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null
}

**返回值**

{
  "code": 200,
  "exception": "云主机备份时使用的存储池"
}

## 7.15 RestoreDisk(恢复云盘)

### 50 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "172.16.1.214",
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "172.16.1.214"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 51 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "172.16.1.214",
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "172.16.1.214"
}

**返回值**

{
  "code": 200,
  "exception": "要恢复的云盘备份记录所在的云主机"
}

### 52 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "172.16.1.214"
}

**返回值**

{
  "code": 200,
  "exception": "云盘备份所在的存储池"
}

### 53 参数vol为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : null,
  "version" : "172.16.1.214"
}

**返回值**

{
  "code": 200,
  "exception": "云主机的云盘备份所使用的的云盘id"
}

### 54 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 7.16 DeleteVMDiskBackup(删除本地云盘)

### 55 正常参数

**请求参数**

{
  "domain" : "a63dd73f92a24a9ab840492f0e538f2b",
  "pool" : "61024b305b5c463b80bceee066077079",
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 56 参数domain为空

**请求参数**

{
  "domain" : null,
  "pool" : "61024b305b5c463b80bceee066077079",
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "要删除云盘的备份所在的云主机"
}

### 57 参数pool为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : "61024b305b5c463b80bceee066077079",
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "备份主机云盘使用的存储池"
}

### 58 参数vol为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : null,
  "version" : "13024b305b5c463b80bceee066077079"
}

**返回值**

{
  "code": 200,
  "exception": "云盘id"
}

### 59 参数version为空

**请求参数**

{
  "domain" : null,
  "pool" : null,
  "vol" : null,
  "version" : null
}

**返回值**

{
  "code": 200,
  "exception": "备份记录的版本号"
}

## 7.17 DeleteRemoteBackupServer(删除远程ftp备份服务器)

### 60 正常参数

**请求参数**

{
  "remote" : "172.16.1.214",
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 61 参数remote为空

**请求参数**

{
  "remote" : null,
  "port" : "21",
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机ip"
}

### 62 参数port为空

**请求参数**

{
  "remote" : null,
  "port" : null,
  "username" : "ftpuser",
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "远程备份的ftp主机端口"
}

### 63 参数username为空

**请求参数**

{
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : "ftpuser"
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

### 64 参数password为空

**请求参数**

{
  "remote" : null,
  "port" : null,
  "username" : null,
  "password" : null
}

**返回值**

{
  "code": 200,
  "exception": "ftpuser"
}

# 8 VirtualMachineNetwork

扩展支持OVN插件.VirtualMachineNetwork所有操作的返回值一样，见**[返回值]**

## 8.1 CreateBridge(创建二层桥接网络，用于vlan场景)

### 1 正常参数

**请求参数**

{
  "nic" : "l2bridge",
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 2 参数nic为空

**请求参数**

{
  "nic" : null,
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是3到12位，只允许数字、小写字母、中划线、以及圆点"
}

### 3 参数name为空

**请求参数**

{
  "nic" : null,
  "name" : null
}

**返回值**

{
  "code": 200,
  "exception": "桥接名，3到12位，只允许数字、小写字母、中划线"
}

## 8.2 DeleteBridge(删除二层桥接网络)

### 4 正常参数

**请求参数**

{
  "nic" : "l2bridge",
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 5 参数nic为空

**请求参数**

{
  "nic" : null,
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "exception": "名称是字符串类型，长度是3到12位，只允许数字、小写字母、中划线、以及圆点"
}

### 6 参数name为空

**请求参数**

{
  "nic" : null,
  "name" : null
}

**返回值**

{
  "code": 200,
  "exception": "桥接名，3到12位，只允许数字、小写字母、中划线"
}

## 8.3 SetBridgeVlan(设置二层网桥的vlan ID)

### 7 正常参数

**请求参数**

{
  "vlan" : "1",
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 8 参数vlan为空

**请求参数**

{
  "vlan" : null,
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "exception": "0~4094"
}

### 9 参数name为空

**请求参数**

{
  "vlan" : null,
  "name" : null
}

**返回值**

{
  "code": 200,
  "exception": "桥接名，3到12位，只允许数字、小写字母、中划线"
}

## 8.4 DelBridgeVlan(删除二层网桥的vlan ID)

### 10 正常参数

**请求参数**

{
  "vlan" : "1",
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 11 参数vlan为空

**请求参数**

{
  "vlan" : null,
  "name" : "l2bridge"
}

**返回值**

{
  "code": 200,
  "exception": "0~4094"
}

### 12 参数name为空

**请求参数**

{
  "vlan" : null,
  "name" : null
}

**返回值**

{
  "code": 200,
  "exception": "桥接名，3到12位，只允许数字、小写字母、中划线"
}

## 8.5 BindPortVlan(给虚拟机绑定vlan ID)

### 13 正常参数

**请求参数**

{
  "mac" : "7e:0c:b0:ef:6a:04",
  "domain" : "950646e8c17a49d0b83c1c797811e004"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 14 参数mac为空

**请求参数**

{
  "mac" : null,
  "domain" : "950646e8c17a49d0b83c1c797811e004"
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

### 15 参数domain为空

**请求参数**

{
  "mac" : null,
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "4-100位，包含小写字母，数字0-9，中划线，以及圆点"
}

## 8.6 UnbindPortVlan(解除虚拟机的vlan ID)

### 16 正常参数

**请求参数**

{
  "mac" : "7e:0c:b0:ef:6a:04",
  "domain" : "950646e8c17a49d0b83c1c797811e004"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 17 参数mac为空

**请求参数**

{
  "mac" : null,
  "domain" : "950646e8c17a49d0b83c1c797811e004"
}

**返回值**

{
  "code": 200,
  "exception": "mac地址不能以fe开头"
}

### 18 参数domain为空

**请求参数**

{
  "mac" : null,
  "domain" : null
}

**返回值**

{
  "code": 200,
  "exception": "4-100位，包含小写字母，数字0-9，中划线，以及圆点"
}

## 8.7 CreateSwitch(创建三层网络交换机)

### 19 正常参数

**请求参数**

{
  "subnet" : "192.168.5.1/24",
  "gateway" : "192.168.5.5"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 20 参数subnet为空

**请求参数**

{
  "subnet" : null,
  "gateway" : "192.168.5.5"
}

**返回值**

{
  "code": 200,
  "exception": "网段和掩码"
}

### 21 参数gateway为空

**请求参数**

{
  "subnet" : null,
  "gateway" : null
}

**返回值**

{
  "code": 200,
  "exception": "IP"
}

## 8.8 DeleteSwitch(删除三层网络交换机)

### 22 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 8.9 ModifySwitch(修改三层网络交换机配置)

### 23 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 8.10 CreateAddress(创建地址列表)

### 24 正常参数

**请求参数**

{
  "address" : "192.168.1.1，192.168.1.2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 25 参数address为空

**请求参数**

{
  "address" : null
}

**返回值**

{
  "code": 200,
  "exception": "IP以,分割"
}

## 8.11 DeleteAddress(删除地址列表)

### 26 正常参数

**请求参数**

{ }

**返回值**

{
  "code": 200,
  "data": true
}

## 8.12 ModifyAddress(修改地址列表)

### 27 正常参数

**请求参数**

{
  "address" : "192.168.1.1，192.168.1.2"
}

**返回值**

{
  "code": 200,
  "data": true
}

### 28 参数address为空

**请求参数**

{
  "address" : null
}

**返回值**

{
  "code": 200,
  "exception": "IP以,分割"
}


