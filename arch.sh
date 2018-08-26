#!/bin/sh
echo "# Explicit Packages:"
temp=$(mktemp /tmp/arch.XXXXXX)
pacman -Qqg base base-devel > $temp
pacman -Qqe | grep -Fxvf $temp | tee arch
rm $temp
