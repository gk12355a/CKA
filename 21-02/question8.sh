kubectl get deployment front-end -n spline-reticulator -o yaml > front-end.yaml
vi front-end.yaml
#find and add containerPort:80 protocol:TCP
cat << EOF >> svc.yaml
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
    tartPort: 80
EOF
kubectl apply -f svc.yaml

