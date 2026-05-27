cat << EOF >> hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata: 
 name: apache-server
 namespace: autoscale
spec: 
 scaleTargetRef:
  apiVersion: app/v1
  kind: Deployment
  name: apacheserver
 minReplicas: 1
 maxReplicas: 4
 metrics:
  - type: Resource
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
