rm /etc/kubernetes/pki/apiserver.*

kubeadm init phase certs all \ 
    --apiserver-advertise-address=0.0.0.0 \
    --apiserver-cert-extra-sans=10.1.1.10,your instance_public_ip

docker rm -f `docker ps -q -f 'name=k8s_kube-apiserver*'`

systemctl restart kubelet