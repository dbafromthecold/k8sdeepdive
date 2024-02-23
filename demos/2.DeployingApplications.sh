############################################################################
############################################################################
#
# Kubernetes Deep Dive - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/k8sdeepdive
# Deploying Applications
#
############################################################################
############################################################################



# navigate to script location
cd /mnt/c/git/k8sdeepdive/demos/yaml



# view daemonset yaml
cat daemonset.yaml



# deploy daemonset
kubectl apply -f daemonset.yaml



# confirm daemonset
kubctl get daemonset



# view more information on daemonset
kubectl describe daemonset mssql



# view pods in daemonset
kubectl get pods -o wide



# delete daemonset
kubectl delete daemonset mssql



# view statefulset yaml
cat statefulset.yaml



# deploy statefulset
kubectl apply -f statefulset.yaml



# confirm statefulset
kubctl get statefulset mssql



# view more information on statefulset
kubectl describe statefulset mssql



# view pods in statefulset
kubectl get pods -o wide



# delete statefulset
kubectl delete statefulset mssql



# view deployment yaml
cat deployment.yaml



# deploy deployment
kubectl apply -f deployment.yaml



# confirm deployment
kubctl get deployment



# view more information on deployment
kubectl describe deployment mssql



# view pods in deployment
kubectl get pods -o wide



# delete deployment
kubectl delete deployment mssql