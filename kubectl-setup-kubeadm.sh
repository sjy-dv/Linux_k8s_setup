# set up kubectl, kubeadm , kubelet
sudo apt-get update && sudo apt-get install -y apt-transport-https curl

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

sudo apt-mark hold kubelet kubeadm kubectl 

#check version
kubeadm version

kubectl version

kubeadm init 

echo "if error you wait 10 sec"

sleep 10

echo "
1. docker info |grep Cgroup \n
2. sudo nano /lib/systemd/system/docker.service \n
3. change file context => ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --exec-opt native.cgroupdriver=systemd \n
4. systemctl daemon-reload \n
5. systemctl restart docker \n
6. ./resetup.sh \n
"