#!/bin/sh

#更新软件包
apk update
#进入root目录
cd /root
#安装所需软件
apk add curl wget transmission-daemon

#安装timezone
apk add -U tzdata
#查看时区列表
ls /usr/share/zoneinfo
#拷贝需要的时区文件到localtime
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#查看当前时间
date
#为了精简镜像，可以将tzdata删除了
apk del tzdata

#安装transmission美化
cd /root
wget https://github.com/ronggang/transmission-web-control/raw/master/release/install-tr-control-cn.sh
chmod +x install-tr-control-cn.sh
sh install-tr-control-cn.sh

#初始化任务
/usr/bin/transmission-daemon
#延长20s
sleep 20s
#杀死任务
pkill transmission-daemon
echo '-----------------------------'
echo 'The installation is complete.'
echo '-----------------------------'