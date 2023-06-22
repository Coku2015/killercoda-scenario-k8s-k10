
<br>

[点击这里访问K10 Web控制台]({{TRAFFIC_HOST1_32000}}/k10/#/)

本环境已经配置了Minio存储桶，在初始化完成后，请进入k10控制台将以下的Minio存储桶配置成Location Profile。
环境中暂无兼容CSI的Storage Class，因此所有备份还原操作仅限GVS模式

[点击这里访问Minio Web控制台]({{TRAFFIC_HOST1_32002}})

Minio User: 
```
minioadmin
```{{copy}}

Minio Password: 
```
minioadmin
```{{copy}}

Minio S3 API 地址: 
```
{{TRAFFIC_HOST1_32001}}
```{{copy}}

默认存储桶：k10


