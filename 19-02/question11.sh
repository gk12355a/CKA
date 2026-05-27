kubectl get pv -A
cat << EOF >> persistantVolumesClaim.yaml
apiVersion: v1
kind: PersistantVolumeClaim
metadata:
 name: mariadb
 namespace: mariadb 
spec:
# storageClassName:
# volumeName: 
 accessMode: 
  - ReadWriteOnce
 resources:
  requests:
   storage: 250Mi
EOF
kubectl apply -f persistantVolumesClaim.yaml
vi mariadb-deployment.yaml
# tìm dòng claimName: -> claimName: mariadb
kubectl apply -f mariadb-deployment.yaml
