#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
bash /ks/k8s.sh

# scenario specific
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml 
helm repo add kasten https://charts.kasten.io/
helm repo update
kubectl create ns kasten-io
helm install k10 kasten/k10 -n kasten-io

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: gateway-nodeport
  namespace: kasten-io
spec:
  selector:
    service: gateway
  ports:
  - name: http
    port: 8000
    nodePort: 32000
  type: NodePort
EOF

kubectl wait --for=condition=ready --timeout=600s pod -A --all

#kubectl apply -f minio.yaml
#sleep 5
#kubectl wait --for=condition=ready --timeout=3000s pod -A --all

# mark init finished
touch /ks/.initfinished