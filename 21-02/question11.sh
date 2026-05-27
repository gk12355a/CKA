cat << EOF >> pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata: 
 name: mariadb
 namespace: mariadb
spec:
# storageClassName:
# volumeName:
 accessMode:
 - ReadWriteOnce
 volumeMode: FileSystem
 resources: 
  request:
   storage: 250Mi
EOF
kubectl apply -f pvc.yaml
