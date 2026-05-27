kubectl get pods -A | grep "flannel|calico|cilium"
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.3/manifests/tigera-operator.yaml 
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.3/manifests/customresources.yaml 
kubectl get pods -n tigera-operator
kubectl get pods -A | grep calico
sudo cat << EOF >> tigera.yaml
apiVersion: tigera.operator.io/v1
kind: Installation
metadata:
 name: tigera
 namespace: tigera-operator
spec:
 cni: 
  type: Calico
 caliconetwork:
  bgp: disabled
  ipPools:
   - cidr: 192.168.0.0/16
     encapsulation: VXLAN
     natOutGoing: Enabled
     nodeSelector: all()
EOF
kubectl apply -f tigera.yaml
cat << EOF >> deny.yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
 name: default-deny-ingress
spec:
 podSelector: {}
 policyTypes:
  - Ingress
EOF
kubectl run test1 --image=busybox
kubectl run test2 --image=busybox
kubectl exec test1 -- ping -c 4 $(kubectl get pod test2 -o jsonpath='{.status.podIP}')


