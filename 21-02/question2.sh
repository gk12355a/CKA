
cat << EOF >> ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
 name: echo
 namespace: sound-repeater
spec: 
 rules:
  - host: example.org/echo
    http:
     paths:
      path: /
      pathType: Prefix
      backend:
       service:
        name: echoserver-service
        port:
         number 8080
EOF
kubectl apply -f ingress.yaml
