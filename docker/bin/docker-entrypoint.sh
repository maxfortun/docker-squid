#!/bin/sh -ex

SWD=$(dirname $0)

chmod o+w /dev/stdout 
chmod o+rwx /var/cache/squid

mutex=/var/cache/squid/reload_mutex

[ -d $mutex ] && rmdir $mutex
[ -f /var/cache/squid/squid.pid ] && rm /var/cache/squid/squid.pid

inotifywait -m -r -e create,modify,delete /etc/squid/ | while read line; do
	[ -z "$line" ] && continue
	! mkdir $mutex > /dev/null || ( set +e; sleep 15; squid -k reconfigure; rmdir $mutex; )
done &
watcher=$!

squid -zN
squid -N

kill $watcher
