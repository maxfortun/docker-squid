#!/bin/sh -ex

SWD=$(dirname $0)

chown -R squid:squid /var/cache/squid
su squid -c 'squid -zN && squid -N'
