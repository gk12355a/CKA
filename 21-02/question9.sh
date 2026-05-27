kubectl get priorityclass --sort-by=.value
cat << EOF >> high-priority.yaml
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
 name: high-priority
value: 35
globalDefault: false
description: "high priority for user workload"
EOF
kubectl apply -f high-priority.yaml
kubectl edit deployment busybox-logger -n priority
#add spec.priorityClassName: high-priority
