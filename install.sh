#!/bin/sh

#更新软件包
apk update
#进入root目录
cd /root
#安装所需软件
apk add wget transmission-daemon

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
apk del wget

#安装transmission美化
cd /root
wget https://github.com/ronggang/transmission-web-control/raw/master/release/install-tr-control-cn.sh
chmod +x install-tr-control-cn.sh
sh install-tr-control-cn.sh

#初始化任务
/usr/bin/transmission-daemon
#延长20s
sleep 10s
#杀死任务
pkill transmission-daemon
#修改配置问文件
sed -i "s%\"rpc-whitelist\": \"127.0.0.1,::1\"%\"rpc-whitelist\": \"0.0.0.0\"%g" /root/.config/transmission-daemon/settings.json
sed -i "s%\"rpc-whitelist-enabled\": true%\"rpc-whitelist-enabled\": false%g" /root/.config/transmission-daemon/settings.json
sed -i "s%\"rpc-authentication-required\": false%\"rpc-authentication-required\": true%g" /root/.config/transmission-daemon/settings.json
sed -i "s%\"cache-size-mb\": 4%\"cache-size-mb\": 64%g" /root/.config/transmission-daemon/settings.json
echo '-----------------------------'
echo 'The installation is complete.'
echo '-----------------------------'