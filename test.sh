#!/bin/sh

if [ -z "$LOADSEM" ] ; then
  echo >&2 "Set \$LOADSEM to the path to loadsem (e.g. main_load.native)"
  exit 1
fi

coredir="$1"
root="$2"

if [ -z "$1" ]; then
  echo >&2 "usage: $0 <coredir> [root]"
  exit 1
fi

for corefile in $(find "$coredir" -name '*-core'); do
  "$LOADSEM" -r "$root" "$corefile" 1>&2 2>"$corefile-loadsem.log"
  echo "$corefile: $?"
done
