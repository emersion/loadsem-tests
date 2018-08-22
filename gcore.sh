#!/bin/sh

set -e

blue="\e[34m"
reset="\e[39m"

bindir="$(pwd)/bin"

cd $(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)

root=$(pwd)

for testcase in hello-static hello-dynamic coreutils-ls glibc-19818 ldso; do
  if [ ! -d "$root/$testcase" ] ; then
    continue
  fi

  cd "$root/$testcase"

  for exe in $(find . -type f); do
    if [ ! -x "$exe" ]; then
      continue
    fi

    main=main
    if [ "$testcase" = ldso ] ; then
      main=dl_main
    fi

    export LD_BIND_NOW=1

    echo -e >&2 "${blue}Generating starti coredump for $testcase $exe${reset}"
    "$bindir/gcore-starti" "$exe"
    echo -e >&2 "${blue}Generating $main coredump for $testcase $exe${reset}"
    "$bindir/gcore-at" "$main" "$exe"
  done
done
