#!/bin/sh
echo "# Official Packages:"
yaourt -Qe | grep '^ext\|^com\|^mul' | awk -F' |/' '{print $2}' | tee arch
echo; echo "# AUR Packages:"
yaourt -Qe | grep '^loc' | awk -F' |/' '{print $2}' | tee aur
