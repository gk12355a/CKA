cat << EOF >> storageClass.yaml
apiVersion: v1
kind: StorageClass
metadata:
 name: local-path
 annotations:
  storageclass.kubernetes.io/is-default-storage: "true"
provisioner: rancher.io/local-path
volumeBindingMode: WaitForFirstCustomer
EOF
kubectl apply -f storageClass.yaml