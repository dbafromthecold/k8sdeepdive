############################################################################
############################################################################
#
# Kubernetes Deep Dive - Andrew Pruski
# @dbafromthecold
# dbafromthecold@gmail.com
# https://github.com/dbafromthecold/k8sdeepdive
# Persisting data
#
############################################################################
############################################################################



# navigate to script location
cd /mnt/c/git/k8sdeepdive/demos/persisting-data/docker-local



# view statefulset
cat local-statefulset.yaml && echo ""



# view storage class yaml
cat local-storageclass.yaml && echo ""



# create storage class
kubectl apply -f local-storageclass.yaml



# view storage class
kubectl get storageclass



# deploy secret (if not already created)
kubectl apply -f local-secret.yaml



# view secret
kubectl get secrets



# deploy sqlserver
kubectl apply -f local-statefulset.yaml



# view statefulset
kubectl get statefulsets -o wide



# describe statefulset
kubectl describe statefulset



# view pods
kubectl get pods -o wide



# view persistent volume claim
kubectl get pvc



# view persistent volume 
kubectl get pv



# view all in default namespace
kubectl get all



# view service yaml
cat local-service.yaml && echo ""



# deploy service
kubectl apply -f local-service.yaml



# view service
kubectl get service mssql-service



# connect via mssql-cli
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# create a database
mssql-cli -S localhost -U sa -P Testing1122 -Q "CREATE DATABASE [testdatabase];"



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# view database files
mssql-cli -S localhost -U sa -P Testing1122 -Q "USE [testdatabase]; EXEC sp_helpfile;"



# view pods with IP address
kubectl get pods -o wide



# delete pod
POD_NAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name") && echo $POD_NAME
kubectl delete pod $POD_NAME



# view new pod's IP address
kubectl get pods -o wide



# describe statefulset
kubectl describe statefulset mssql-statefulset



# view persistent volume claim
kubectl get pvc



# view persistent volumes
kubectl get pv



# view service
kubectl get service



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete statefulset mssql-statefulset
kubectl delete service mssql-service
kubectl delete secret mssql-sa-password
kubectl delete pvc --all
kubectl delete sc local-storage
