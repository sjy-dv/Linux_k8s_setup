kubeadm init

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

# kubectl 확인

kubectl get nodes

kubectl get po -n kube-system

#set up calico
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml

#look calico process
kubectl get po -n kube-system -w

echo "now you join worker node join to cluster\n"
echo "example\n"
echo "kubeadm join 10.1.1.10:6443 --token oc1crn.fr0wtn6k8vmxml80 \
    --discovery-token-ca-cert-hash sha256:913c8cfd3249b4c45e61c3ce6dccb13baa086d2b617782b7dcd2ef730cb3dc60 \n"
echo "try to `kubectl get nodes` \n"    
echo "if you to obtain a new master node certificate, try to cert.sh"