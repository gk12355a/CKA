kubectl edit deployment front-end -n spline-reticulator 
# add containerPort:80, protocol: TCP
cat << EOF >> front-svc.yaml
apiVersion: v1
kind: Service
metadata:
 name: front-end-svc 
 namespace: spline-reticulator 
spec:
 type: NodePort
 selector:
  app: front-end
 ports:
  - protocol: TCP
    port: 80
    targetPort: 80
EOF
kubectl apply -f front-svc.yaml

