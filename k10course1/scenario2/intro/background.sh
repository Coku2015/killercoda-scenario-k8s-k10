export KUBECONFIG=/etc/rancher/k3s/k3s.yaml 
helm repo add kasten https://charts.kasten.io/
helm repo update
kubectl create ns kasten-io
helm install k10 kasten/k10 -n kasten-io
kubectl wait --for=condition=ready --timeout=3000s pod -A --all
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

kubectl apply -f https://raw.githubusercontent.com/Coku2015/killercoda-scenario-k8s-k10/main/k10course1/scenario2/intro/minio.yaml
sleep 5
kubectl wait --for=condition=ready --timeout=3000s pod -A --all

echo done > /tmp/background1