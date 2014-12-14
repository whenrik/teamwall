#!/bin/sh
/usr/bin/mongod &
export LEIN_ROOT=yes
/root/bin/lein run
