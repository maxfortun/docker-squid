#!/bin/sh -ex

SWD=$(dirname $0)

chmod o+w /dev/stdout
chmod o+rwx /var/cache/squid

inotifywait -m -r /etc/squid/ | while read line; do


done &

squid -zN
squid -N
