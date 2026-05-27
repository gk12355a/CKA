kubectl scale --replicas=0 deployment wordpress -n relative-fawn 
kubectl edit deployment wordpress -n relative-fawn 
# find make request.cpu to 100m request.memory to 200Mi
kubectl scale --replicas=3 deployment wordpress -n relative-fawn