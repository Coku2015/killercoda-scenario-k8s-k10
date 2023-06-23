#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

rm $0

helm repo add kasten https://charts.kasten.io/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
kubectl create ns kasten-io

echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc

# mark init finished
touch /ks/.initfinished