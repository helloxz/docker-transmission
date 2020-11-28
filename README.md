# Docker-Transmission
Transmission是一种BitTorrent客户端，特点是一个跨平台的后端和其上的简洁的用户界面。特别适合用来跑PT，为了方便使用，打包为Docker镜像，已安装transmission-web-control界面美化。

![](https://i.bmp.ovh/imgs/2020/11/ec82440e96cee747.png)



### 构建

```bash
# 克隆仓库
git clone https://github.com/helloxz/docker-transmission.git
# 进入仓库目录
cd docker-transmission
# 构建Docker镜像
docker build -t yourname:transmission .
```

### 运行

如果是参考上述方法自行构建，输入：

```bash
docker run -d --name="transmission" \
  -e USERNAME=xiaoz \
  -e PASSWORD=xiaoz.me \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /data/test:/root/Downloads \
  --restart=always \
  yourname:transmission
```

如果不想自行构建，xiaoz已打包为Docker镜像，可以直接输入以下命令运行：

```bash
docker run -d --name="transmission" \
  -e USERNAME=xiaoz \
  -e PASSWORD=xiaoz.me \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /data/test:/root/Downloads \
  --restart=always \
  helloz/transmission
```

**参数说明：**

- USERNAME: Transmission 用户名
- PASSWORD: Transmission密码
- /data/test: 为本地下载文件夹，请根据实际情况修改

### 联系我

* Blog：https://www.xiaoz.me/
* QQ：337003006