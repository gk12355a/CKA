cat << EOF >> ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: echo
  namespace: sound-reapter
spec:
 rules:
  - host: echo.example.org/echo
    http:
      paths:
       - path: /
         pathType: Prefix
         backend: 
          service:
            name: echoserver-service
             port:
              number: 80
EOF
kubectl apply -f ingress.yaml
