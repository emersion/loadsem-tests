#!/bin/sh

if [ -z "$LOADSEM" ] ; then
  echo "Set \$LOADSEM to the path to loadsem (e.g. main_load.native)" >2
  exit 1
fi

function run_tests() {
  coredir="$1"
  root="$2"

  for corefile in $(find "$coredir" -name '*-core'); do
    "$LOADSEM" -r "$root" "$corefile" 1>&2 2>"$corefile-loadsem.log"
    echo "$corefile: $?"
  done
}

if [ -z "$1" ]; then
	run_tests "linux-x86_64" ""
	run_tests "linux-mips64" "/home/simon/tmp/qemu-mips64el/hda"
  run_tests "freebsd-amd64" "/home/simon/tmp/qemu-freebsd-amd64/hda"
else
	run_tests "$@"
fi
