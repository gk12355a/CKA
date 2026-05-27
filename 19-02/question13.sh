kubectl get ns frontend --show-labels
kubectl get pods -n frontend --show-lables
kubectl get pods -n backend --show-lables
kubectl get svc -n backend
kubectl apply -f ~/netpol/allow-frontend-to-backend.yaml -n backend 
kubectl get networkpolicy -n backend 
kubectl describe networkpolicy <name-from-get> -n backend 