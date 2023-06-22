
## 1.1. Helm简介
在使用Helm命令前，检查Helm是否正确安装，可以用以下命令检查

```bash
helm version
```{{exec}}

如果没有安装Helm，可以参考[这里](https://helm.sh/docs/intro/install/)进行安装。

## 1.2. 添加Chart仓库
Chart仓库就是Kubernetes的软件仓库，类似于Linux的软件仓库，可以通过添加Chart仓库来获取软件包。

Kasten K10的软件仓库地址是：https://charts.kasten.io/
另外比较知名的Bitnami的软件仓库地址是：https://charts.bitnami.com/bitnami

添加Chart仓库的命令是：helm repo add <仓库名称> <仓库地址>
其中仓库名称可以根据自己的喜好来命名，仓库地址就是上面的地址。
我们来添加Kasten K10的软件仓库和Bitnami的软件仓库

```bash
helm repo add veeam-kasten https://charts.kasten.io/
```{{exec}}

```bash
helm repo add veeam-bitnami https://charts.bitnami.com/bitnami
```{{exec}}

添加完成后，可以通过以下命令查看已添加的Chart仓库

```bash
helm repo list
```{{exec}}

## 1.3. 更新Chart仓库

添加完Chart仓库后，可以通过以下命令更新Chart仓库，这个更新会将本地缓存刷新成和远程仓库一致的内容，通常在软件升级时会用到这个命令

```bash
helm repo update
```{{exec}}

## 1.4. 搜索Chart内容
可以通过以下命令搜索Chart内容：helm search repo <关键字>

```bash
helm search repo kasten
```{{exec}}

搜索出来的内容中，我们可以看到Name、Chart Version、App Version、Description等信息，其中Name就是软件名称，Chart Version就是软件版本，App Version就是软件的版本，Description就是软件的描述。
其中Name中，一般由两部分组成，<仓库名称>/<软件名称>。

如果需要搜索仓库内所有版本的Chart，可以使用--versions参数

```bash
helm search repo kasten --versions
```{{exec}}





