export KUBECONFIG=/etc/rancher/k3s/k3s.yaml 
helm repo add kasten https://charts.kasten.io/
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

echo done > /tmp/background1