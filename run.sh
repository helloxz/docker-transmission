#!/bin/sh

#判断配置文件夹是否存在
if [ -f "/root/.config/transmission-daemon/settings.json" ]
then
	#清空日志
	echo '' > /root/.config/transmission-daemon/transmission.log
	#启动服务
	/usr/bin/transmission-daemon -u ${USERNAME} -v ${PASSWORD} -e /root/.config/transmission-daemon/transmission.log
	#查看日志
	tail -f /root/.config/transmission-daemon/transmission.log
else
	mv -f /root/.config/transmission-daemon.bak/ /root/.config/transmission-daemon/
	#清空日志
	echo '' > /root/.config/transmission-daemon/transmission.log
	#启动服务
	/usr/bin/transmission-daemon -u ${USERNAME} -v ${PASSWORD} -e /root/.config/transmission-daemon/transmission.log
	#查看日志
	tail -f /root/.config/transmission-daemon/transmission.log
fi