#!/bin/sh

sed -i "s|HOSTDOMAIN|$HOSTDOMAIN|g;s|VPATH|$VPATH|g;s|MPATH|$MPATH|g" /etc/nginx/nginx.conf
sed -i "s|HOSTDOMAIN|$HOSTDOMAIN|g;s|UUID|$UUID|g;s|VPATH|$VPATH|g;s|MPATH|$MPATH|g" /etc/myconfig/conn.json
sed -i "s|FC_HOST|$FC_HOST|g;s|FC_PORT|$FC_PORT|g;s|FC_TOKEN|$FC_TOKEN|g" /etc/myconfig/fc.ini
sed -i "s|BKPASSWORD|$UUID|g;" /etc/myconfig/supervisord.conf

/usr/bin/supervisord -c /etc/myconfig/supervisord.conf