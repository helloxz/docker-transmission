#!/bin/sh

#/root/.config/transmission-daemon/settings.json
#替换用户名

#sed  "s%\"rpc-username\": \"xiaoz\"%\"rpc-username\": \"${USERNAME}\"%g" /root/.config/transmission-daemon/settings.json
#替换密码
#sed "s%\"rpc-password\": \".*%\"rpc-password\": \"${PASSWORD}\",%g" /root/.config/transmission-daemon/settings.json
#清空日志
echo '' > /var/log/transmission/transmission.log
#启动服务
/usr/bin/transmission-daemon -u ${USERNAME} -v ${PASSWORD} -e /var/log/transmission/transmission.log
#查看日志
tail -f /var/log/transmission/transmission.log