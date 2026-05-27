helm repo add argo https://argoproj.github.io/argo-helm 
helm repo update
helm install argocd argo/argo-cd --namespace=argocd --create-namespace --vesion 7.7.4 --skip-crds