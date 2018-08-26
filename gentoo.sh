#!/bin/sh
echo "# Selected Packages:"
emerge -qp @selected | grep -o '[^ ]*/.*' | while read line; do qatom -F "%{CATEGORY}/%{PN}" $line; done | sort | tee gentoo
