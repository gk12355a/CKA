kubectl scale --replicas=0 deployment nginx-static -n nginx-static
kubectl get cm nginx-config -n nginx-static -o yaml > cm.yaml
vi cm.yaml
# change tls v1.2 to v1.3 
kubectl delete cm.yaml #ole version before change
kubectl apply -f cm.yaml #new version
kubectl scale --replicas=1 deployment nginx-static -n nginx-static