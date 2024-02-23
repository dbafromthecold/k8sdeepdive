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



# connect to app within pod
POD_ID=$(kubectl get pod nginx -o jsonpath="{.status.podIP}") && echo $POD_ID
ssh ap-k8s-01 -- curl $POD_ID --no-progress-meter



# delete pod
kubectl delete pod nginx



# confirm pod deletion
kubectl get pods



# create a deployment
kubectl create deployment nginx --image=nginx



# view deployment information
kubectl get deployments



# view deployment events
kubectl describe deployment nginx



# get information on pod in deployment
kubectl get pods -o wide --show-labels



# view pod events
kubectl describe pod -l app=nginx



# delete pod
POD=$(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
kubectl delete pod $POD



# confirm new pod
kubectl get pods -o wide



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