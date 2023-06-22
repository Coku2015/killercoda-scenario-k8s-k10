
## 3.1. 升级软件

升级软件前，我们需要先更新同步下本地的软件仓库，命令如下：

```bash
helm repo update
```{{exec}}

要升级已安装的软件，可以使用以下命令: `helm upgrade <安装实例名称> <仓库名称>/<软件名称> -n <k8s命名空间>`

我们来试下升级Kasten K10，命令如下：

```bash
helm upgrade my-k10 veeam-kasten/k10 -n kasten-io
```{{exec}}

和helm install命令一样，helm upgrade命令也可以加入--version参数来指定我们需要的版本。

升级完成后，我们再使用`helm history`命令来查看这份软件的安装历史，命令如下：

```bash
helm history my-k10 -n kasten-io
```{{exec}}

## 3.2. 回滚软件

如果升级后发现软件有问题，可以使用以下命令回滚软件: `helm rollback <安装实例名称> <版本号> -n <k8s命名空间>`

其中版本号可以通过`helm history`命令来查看。

我们来试下回滚Kasten K10至6.0.0，命令如下：

```bash
helm rollback my-k10 1 -n kasten-io
```{{exec}}

