#!/bin/sh -ex

SWD=$(dirname $0)

chmod o+w /dev/stdout
chmod o+rwx /var/cache/squid

inotifywait -m -r /etc/squid/ | while read line; do
	! mkdir /var/cache/squid/reload_needed || ( sleep 15; squid -k reconfigure; rmdir /var/cache/squid/reload_needed; )
done &

squid -zN
squid -N
