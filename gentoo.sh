#!/bin/sh
echo "# Selected Packages:"
groups | grep -qw portage && sudo=sudo || sudo=
$sudo emerge -qp @selected | grep -o '[^ ]*/.*' | sort | tee gentoo
