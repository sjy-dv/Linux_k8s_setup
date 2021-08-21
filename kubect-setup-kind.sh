#set-up k8s.io tools
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.10.0/kind-linux-amd64

chmod +x ./kind

sudo mv ./kind /usr/local/bin/

kind create cluster --name your_cluster_name

#check process
kubectl cluster-info

kubectl config view

