###########################################
##
## Copyright (2019, ) Institute of Software
##     Chinese Academy of Sciences
##      {wuheng,xuyuanjia2017}@otcaix.iscas.ac.cn
##
###########################################

token=$(kubeadm token list | grep kubeadm | grep init | awk '{print $1}')
hash=$(openssl x509 -in /etc/kubernetes/pki/ca.crt -noout -pubkey | openssl rsa -pubin -outform DER 2>/dev/null | sha256sum | cut -d' ' -f1)

echo "kubeadm join $1:6443 --token $token --discovery-token-ca-cert-hash sha256:$hash"
