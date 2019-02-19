#!/bin/sh
NAME=$(realpath $0)
DIR=$(dirname $NAME)
install -Dm644 $DIR/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
install -Dm644 $DIR/modprobe-bbswitch.conf /etc/modprobe.d/bbswitch.conf
install -Dm644 $DIR/modules-load-bbswitch.conf /etc/modules-load.d/bbswitch.conf
