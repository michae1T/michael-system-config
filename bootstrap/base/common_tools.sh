#!/bin/bash

source `dirname $0`/../_environment.sh

if [ -z "$PREFIX" ] ; then
  require_root
  PREFIX=/opt/bin
fi;

mkdir -p $PREFIX

curl http://beyondgrep.com/ack-2.14-single-file > $PREFIX/ack
chmod +x $PREFIX/ack

cp $SCRIPTS_DIR/common-tools/* $PREFIX

