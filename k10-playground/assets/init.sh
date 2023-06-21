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
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create ns nginx
kubectl create ns minio
kubectl create ns kasten-io
helm install objectstorage bitnami/minio -n minio \
  --set auth.rootUser=minioadmin \
  --set auth.rootPassword=minioadmin
helm install k10 kasten/k10 -n kasten-io \
  --set injectKanisterSidecar.enabled=true \
  --set excludedApps[0]="minio"

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

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: minio-nodeport
  namespace: minio
spec:
  selector:
    app.kubernetes.io/instance: objectstorage
  ports:
  - name: minio-api
    port: 9000
    nodePort: 32001
    protocol: TCP
  - name: minio-console
    port: 9001
    nodePort: 32002
    protocol: TCP
  type: NodePort
EOF

kubectl wait --for=condition=ready --timeout=600s pod -n kasten-io --all

kubectl run --namespace minio objectstorage-minio-client \
    --rm -it --restart='Never' \
    --image docker.io/bitnami/minio-client:2023.5.18-debian-11-r2 -- \
    /bin/sh -c "mc alias set k10minio http://objectstorage-minio:9000 minioadmin minioadmin && mc mb k10minio/k10"

kubectl apply -f /ks/k10secret.yaml
kubectl apply -f /ks/profile.yaml

helm install webserver bitnami/nginx -n nginx

# mark init finished
touch /ks/.initfinished