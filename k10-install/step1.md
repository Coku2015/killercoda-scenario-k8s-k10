
1. 确认Helm版本

```plain
helm version
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

6. 通过nodeport发布服务
```plain
kubectl expose services
```{{exec}}
