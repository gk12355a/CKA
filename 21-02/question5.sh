kubectl get deployment synergy-leverager -o yaml > synergy-leverager.yaml
kubectl edit deployment synergy-leverager 
vi synergy-leverager.yaml
#find containers path and add this:
# containers:
# - name: sidecar
#   image: busybox:stable
#   commands:
#   - /bin/sh
#   - -c
#   - "tail n+1 -f /var/log/synergy-leverager.log" 
#   volumMounts:
#   - name: varlog
#     mountPath: /var/log
kubectl apply -f synergy-leverager.yaml
kubectl describe deployment ynergy-leverager
