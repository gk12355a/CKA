kubectl get priorityclass --sort-by=.value
# ví dụ giá trị cao nhất là 36
cat << EOF >> high-priority.yaml
apiVersion: scheduling.k8s.io/v1
kind: PriorityClass
metadata:
 name: high-priority 
value: 35
globalDefault: false
description: "High priority class for user-workloads" 
EOF

kubectl apply -f high-priority.yaml

kubectl edit deployment busybox-logger -n priority
# in spec: add this priorityClassName: high-priority
