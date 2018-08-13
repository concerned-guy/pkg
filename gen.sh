#!/bin/sh

mkdir -p pkglist

echo -ne "# Official Packages:\n"
yaourt -Qe | egrep -v '^(core|base|local)' | awk '{print $1}'| tee pkglist/arch

echo -ne "\n# AUR Packages:\n"
yaourt -Qe | egrep ^local | awk '{print $1}' | tee pkglist/aur

echo -ne "\nDone!!\n"
