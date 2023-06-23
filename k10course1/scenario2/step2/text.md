
## 2.1 高级安装参数

在安装更新Kasten K10时，可以为`helm install`或`helm upgrade`命令添加`--set`参数来指定安装参数，比如我们可以设定第三方镜像仓库、启用GVS备份模式等。

以helm upgrade为例，我们来试下启用GVS备份模式，命令如下：

```bash
helm upgrade my-k10 veeam-kasten/k10 -n kasten-io \
    --set injectKanisterSidecar.enabled=true 
```{{exec}}

当我们在安装完成后，可以通过`helm get values`命令来查看当前安装的参数，命令如下：

```bash
helm get values my-k10 -n kasten-io --output yaml
```{{exec}}

更多关于Kasten K10 Helm参数，请查看[Kasten使用手册](https://docs.kasten.io/latest/install/advanced.html#complete-list-of-k10-helm-options)
