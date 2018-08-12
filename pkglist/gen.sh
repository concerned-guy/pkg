#!/bin/sh

echo -ne "# Official Packages:\n"
yaourt -Qe | egrep -v '^(core|base|local)' | tee arch

echo -ne "\n# AUR Packages:\n"
yaourt -Qe | egrep ^local | tee aur

echo -ne "\nDone!!\n"
