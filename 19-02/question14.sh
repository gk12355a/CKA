kubectl get crds| grep cert-manager  > resources.yaml 
kubectl explain certificate.spec.subject > ~/subject.yaml 