#!/bin/bash

ACNG=/usr/sbin/apt-cacher-ng
RUNDIR="/var/run/$NAME"

PIDFILE="$RUNDIR/pid"
SOCKETFILE="$RUNDIR/socket"
ACNG_OPTS="$ACNG_OPTS pidfile=$PIDFILE SocketPath=$SOCKETFILE foreground=1 -c /etc/apt-cacher-ng"

$ACNG $ACNG_OPTS

