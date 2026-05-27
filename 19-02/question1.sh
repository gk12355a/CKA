cat << EOF >>  hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: apache-server
  namespace: autoscale
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: apacheserver
  minReplicas: 1
  maxReplicas: 4
  metrics:
   - type: Resources
     resource:
       name: cpu
       target:
        type: Utilization
        averageUtilization: 50
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 30
EOF
kubectl apply -f hpa.yaml
kubectl get hpa -n autoscale
kubectl describe hpa -n autoscale apache-server
