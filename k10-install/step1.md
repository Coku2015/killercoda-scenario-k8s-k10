
1. 确认Helm版本

```plain
helm version
```{{exec}}
1a. 加载环境kubectl的变量

```plain
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml 
```{{exec}}

2. 添加Helm Kasten Repository

```plain
helm repo add kasten https://charts.kasten.io/
```{{exec}}

3. 创建Namespace
```plain
k create ns kasten-io
```{{exec}}

4. 安装Kasten K10
```plain
helm install k10 kasten/k10 -n kasten-io
```{{exec}}

5. 查看Pod启动状况
```plain
watch -n 2 'kubectl get pod -n kasten-io'
```{{exec}}
全部处于running状态后，按Ctrl+c退出回到命令行

6a. 通过nodeport发布服务，先创建svc的yaml文件
```plain
cat > k10-nodeport-svc.yaml << EOF
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
```{{exec}}

6b. 创建服务Nodeport服务

```plain
kubectl apply -f k10-nodeport-svc.yaml
```{{exec}}

7. 访问K10网页控制台

[点击这里访问K10 Dashbord]({{TRAFFIC_HOST1_32000}}/k10/#/)



