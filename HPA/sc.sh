# Question 1: Create a new Horizontal PodAutoscale (HPA)  create HPA for deployment with min 1, max 4, cpu 50%,  stabilization window 300 seconds 

kubectl create namespace autoscale
kubectl apply -f apache-hpa.yaml