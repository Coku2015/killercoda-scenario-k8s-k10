## 1.1. 使用Helm安装软件的指定版本

在`helm install`或者`helm upgrade`命令中，我们可以加入--version参数来指定我们需要的版本。

我们来试下安装k10 6.0.0这个版本

```bash
helm install my-k10 kasten/k10 --version 6.0.0 -n kasten-io
```{{exec}}

在安装完成后，注意观察所有Pod是否正常启动。我们开放下nodeport端口, 命令如下：
```bash
kubectl apply -f k10-nodeport.yaml
```{{exec}}

这条命令执行成功后，请点击这个链接访问[Kasten K10的Web UI]({{TRAFFIC_HOST1_32000}}/k10/#/)

## 1.2. 升级软件

升级软件前，我们需要先更新同步下本地的软件仓库，命令如下：

```bash
helm repo update
```{{exec}}

要升级已安装的软件，可以使用以下命令: `helm upgrade <安装实例名称> <仓库名称>/<软件名称> -n <k8s命名空间>`

我们来试下升级Kasten K10，命令如下：

```bash
helm upgrade my-k10 kasten/k10 -n kasten-io
```{{exec}}

升级完成后，我们再使用`helm history`命令来查看这份软件的安装历史，命令如下：

```bash
helm history my-k10 -n kasten-io
```{{exec}}


