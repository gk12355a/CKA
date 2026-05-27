kubectl get deployment synergy-leverager -n default -o yaml  > synergy-leverager.yaml
kubectl edit deployment synergy-leverager -n default
vi synergy-leverager.yaml
# add this
# containers:
# - name: synergy-leverager
#   volumeMounts: 
#     - name: varlog
#       path: /var/log
# - name: sidecar
#   image: busybox:stable
#   command:
#   - /bin/sh 
#   - -c
#   - "tail n+1 -f /var/log/synergy-leverager.log" 
#   volumeMounts:
#   - name: varlog
#     mountPath: /var/log/
kubectl apply -f synergy-leverager.yaml
kubectl get pod -n default
