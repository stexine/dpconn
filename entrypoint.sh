#!/bin/sh

sed -i "s|HOSTDOMAIN|$HOSTDOMAIN|g;s|VPATH|$VPATH|g;s|MPATH|$MPATH|g" /etc/myconfig/caddyfile
sed -i "s|HOSTDOMAIN|$HOSTDOMAIN|g;s|UUID|$UUID|g;s|VPATH|$VPATH|g;s|MPATH|$MPATH|g" /etc/myconfig/conn.json
sed -i "s|BKPASSWORD|$UUID|g;" /etc/myconfig/supervisord.conf

/usr/bin/supervisord -c /etc/myconfig/supervisord.conf