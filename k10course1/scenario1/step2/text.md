
## 2.1. 使用Helm安装软件

Helm安装软件的命令是：`helm install <安装实例名称> <仓库名称>/<软件名称> -n <k8s命名空间>`，其中<安装实例名称>可以根据自己的喜好来命名，<仓库名称>就是上面添加的仓库名称，<软件名称>就是上面搜索出来的软件名称，<k8s命名空间>就是软件要安装到的k8s命名空间。

我们先来创建个k8s的namespace，命名为kasten-io，命令如下：

```bash
kubectl create namespace kasten-io
```{{exec}}

接着我们来安装Kasten K10的软件包，安装实例名称为my-k10，仓库名称为kasten，命令如下：

```bash
helm install my-k10 veeam-kasten/k10 -n kasten-io
```{{exec}}

## 2.2. 查看安装状态

执行安装命令后，会返回安装状态，如果安装成功，会返回状态信息。
通常安装会去镜像库拉取软件容器镜像，如果网络不好，可能会导致安装失败，可以通过以下命令查看安装状态：

```bash
watch -n 2 'kubectl get pods -n kasten-io'
```{{exec}}

按退出快捷键Ctrl+C可以结束查看退出以上命令。

对于已安装的软件，也可以通过`helm status`来再次获取安装状态，命令如下：

```bash
helm status my-k10 -n kasten-io
```{{exec}}

另外，还可以通过`helm history`命令来查看这份软件的安装历史，命令如下：

```bash
helm history my-k10 -n kasten-io
```{{exec}}

## 2.3. 卸载软件

要清理安装的软件，可以使用以下命令: `helm uninstall <安装实例名称> -n <k8s命名空间>`

我们试下卸载Kasten K10，命令如下：

```bash
helm uninstall my-k10 -n kasten-io
```{{exec}}

## 2.4. 使用Helm安装软件的指定版本

在helm安装命令中，我们可以加入--version参数来指定我们需要的版本。

我们来试下安装k10 6.0.0这个版本

```bash
helm install my-k10 veeam-kasten/k10 --version 6.0.0 -n kasten-io
```{{exec}}

在安装完成后，注意观察所有Pod是否正常启动。

