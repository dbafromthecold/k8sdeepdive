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
cd /mnt/c/git/k8sdeepdive/demos/persisting-data



# view storage class yaml
cat storage-class.yaml



# create storage class
kubectl apply -f storage-class.yaml



# view storage class
kubectl get sc



# view persistent volume claim yaml
cat pvc.yaml



# create persistent volume claim
kubectl apply -f pvc.yaml



# view persistent volume claim
kubectl get pvc



# view persistent volume 
kubectl get pv



# describe persistent volume 
kubectl describe pv



# view secret yaml
cat secret.yaml



# view secret
kubectl get secrets



# describe secret
kubectl describe secret mssql-sa-secret



# try and get more info on secret
kubectl get secret mssql-sa-secret -o yaml



# decode secret
kubectl get secret mssql-sa-secret -o jsonpath='{ .data.MSSQL_SA_PASSWORD }' | base64 --decode && echo ""



# view deployment 
cat deployment.yaml



# deploy sqlserver
kubectl apply -f deployment.yaml



# view deployments
kubectl get deployments



# view pods
kubectl get pods



# view service
kubectl get service



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
$PODNAME=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl delete pod $PODNAME



# view new pod's IP address
kubectl get pods -o wide



# view persistent volume claim
kubectl get pvc



# view volume
kubectl get pv



# view service
kubectl get service



# view databases
mssql-cli -S localhost -U sa -P Testing1122 -Q "SELECT [name] FROM sys.databases;"



# clean up
kubectl delete deployment sqlserver2022-deployment
kubectl delete service sqlserver2022-service
kubectl delete secret mssql-sa-secret
kubectl delete pvc mssql-data mssql-log mssql-system
kubectl delete sc mssql-storage
