############################################################################
############################################################################
#
# Kubernetes Deep Dive - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/k8sdeepdive
# Kubernetes Components
#
############################################################################
############################################################################



# view node details
kubectl get nodes -o wide



# get component statuses
kubectl get componentstatus



# get namespaces in cluster
kubectl get namespaces



# view pods in system namespace
kubectl get pods -n kube-system



# check etcd status
ssh ap-k8s-01 -- sudo ETCDCTL_API=3 etcdctl -w table \
--endpoints 127.0.0.1:2379 \
--cacert /etc/kubernetes/pki/etcd/ca.crt \
--cert /etc/kubernetes/pki/etcd/server.crt \
--key /etc/kubernetes/pki/etcd/server.key \
endpoint status



# view control node taint
kubectl describe node ap-k8s-01



# deploy a pod
kubectl run nginx --image=nginx



# confirm pod created
kubectl events



# view pod information
kubectl get pods



# view pod events
kubectl describe pods



# get more information on pod
kubectl get pods -o wide



# get api server endpoint
kubectl cluster-info



# get kubernetes version via curl
curl --cacert /home/apruski/k8s/apiserver.crt https://10.0.0.41:6443/version



# get info on pod from api server
curl -X GET https://10.0.0.41:6443/api/v1/namespaces/default/pods \
    --cacert /mnt/c/git/PrivateCodeRepo/Kubernetes/Hyper-V/local-lab-certs/apiserver.crt \
    --cert /mnt/c/git/PrivateCodeRepo/Kubernetes/Hyper-V/local-lab-certs/clientcert.pem \
    --key /mnt/c/git/PrivateCodeRepo/Kubernetes/Hyper-V/local-lab-certs/clientkey.pem



# connect to app within pod
POD_ID=$(kubectl get pod nginx -o jsonpath="{.status.podIP}") && echo $POD_ID
ssh ap-k8s-01 -- curl $POD_ID --no-progress-meter



# get node pod is running on
NODE=$(kubectl get pod nginx -o jsonpath="{.spec.nodeName}") && echo $NODE



# get status of containerd
ssh $NODE -- systemctl status --lines 0 containerd



# list all running containers
ssh $NODE -- sudo ctr -n k8s.io container ls



# list nginx container
ssh $NODE -- sudo ctr -n k8s.io container ls | grep nginx



# delete pod
kubectl delete pod nginx



# confirm pod deletion
kubectl get pods



# create a deployment
kubectl create deployment nginx --image=nginx



# view deployment information
kubectl get deployments -o wide



# view deployment events
kubectl describe deployment nginx



# view replicaset
kubectl get replicasets



# view replicaset events
kubectl describe replicaset



# view pod events
kubectl describe pod -l app=nginx



# get information on pod in deployment
kubectl get pods -o wide --show-labels



# delete pod
POD=$(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
kubectl delete pod $POD



# confirm new pod
kubectl get pods -o wide



# view replicaset events
kubectl describe replicasets nginx



# delete deployment
kubectl delete deployment nginx



# view status of kubelet on worker node
ssh ap-k8s-02 -- systemctl --lines 0 status kubelet



# view kubelet configuration file
ssh ap-k8s-02 -- sudo cat /var/lib/kubelet/config.yaml | grep static



# get yaml to deploy static pod - https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/
kubectl run nginx --image=nginx --dry-run=client -o yaml



# save yaml
kubectl run nginx --image=nginx --dry-run=client -o yaml > ~/nginx.yaml



# copy pod yaml to worker node
cat ~/nginx.yaml | ssh ap-k8s-02 "sudo tee -a /etc/kubernetes/manifests/nginx.yaml"



# view created pod
kubectl get pods



# view kube-system pods
kubectl get pods -n kube-system



# view pod events
kubectl describe pod



# delete pod
kubectl delete pod nginx-ap-k8s-02



# view recreated pod
kubectl get pods



# remove file
ssh ap-k8s-02 "sudo rm /etc/kubernetes/manifests/nginx.yaml"



# confirm pod deleted
kubectl get pods