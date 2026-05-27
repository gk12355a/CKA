kubectl scale --replicas=0 deployment wordpress -n relative-fawn
kubectl edit deployment wordpress -n relative-fawn
# find to containers path in yaml file and change the resource to a fair request.cpu=100m resquest.memory=200Mi
kubectl scale --replicas=3 deployment wordpress -n relative-fawn
