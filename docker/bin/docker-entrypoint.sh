#!/bin/sh -ex

SWD=$(dirname $0)

squid -zN
squid -N
