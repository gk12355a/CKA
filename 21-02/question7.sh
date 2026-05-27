
cat << EOF >> sc.yaml
apiVersion: v1
kind: StorageClass
metadata:
 name: local-path
 annotation:
  storageclass.kubernetes.io/is-default-storage: "true"
provisioner: rancher.io/local-path
bindingMode: WaitForFirstCustomer
EOF
kubectl ctl apply -f sc.yaml
