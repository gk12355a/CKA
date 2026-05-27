kubectl get gatewayclass
kubectl get svc
kubectl get secret
cat << EOF >> gw.yaml
apiVersion: gateway.networking.k8s.io/v1
kind: GateWayClass
metadata:
 name: web-gateway
spec: 
 gatewayClassName: nginx
 listeners:
 - name: https
   protocol: HTTPS
   port: 443
   hostname: gateway.web.k8s.local 
   tls:
    mode: Terminate
    certificateRefs:
    - name: web-secret
EOF
cat << EOF >> httpRoute.yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata: 
 name:  web-route 
spec: 
 parentRef:
 - name: web-gateway
 hostName:
 - gateway.web.k8s.local 
 rules:
 - matches:
   - path: 
      type: PathPrefix
      value: /
   backendRefs:
   - name: web-svc
     port: 80
EOF
kubectl apply -f gw.yaml
kubectl apply -f httpRoute.yaml
kubectl delete ingress web