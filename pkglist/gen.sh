#!/bin/sh

echo -ne "# Official Packages:\n"
yaourt -Qe | egrep -v '^(core|base|local)' | awk '{print $1}'| tee arch

echo -ne "\n# AUR Packages:\n"
yaourt -Qe | egrep ^local | awk '{print $1}' | tee aur

echo -ne "\nDone!!\n"
