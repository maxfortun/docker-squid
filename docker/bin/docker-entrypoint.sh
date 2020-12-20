#!/bin/sh -ex

SWD=$(dirname $0)

chmod o+w /dev/stdout
chmod o+rwx /var/cache/squid

squid -zN
squid -N
