#!/bin/sh

sed -i "s|UUID|$UUID|g;s|VPATH|$VPATH|g;s|MPATH|$MPATH|g" /etc/myconfig/conn.json
sed -i "s|BKPASSWORD|$UUID|g;" /etc/supervisor/conf.d/supervisord.conf

/usr/bin/supervisord -c /etc/supervisord.conf