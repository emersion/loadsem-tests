#!/bin/sh

set -e

blue="\e[34m"
reset="\e[39m"

bindir="$(pwd)/bin"

cd $(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)

root=$(pwd)

for testcase in hello-static hello-dynamic coreutils-ls glibc-19818; do
  cd "$root/$testcase"

  for exe in $(find . -type f); do
    if [ ! -x "$exe" ]; then
      continue
    fi
    export LD_BIND_NOW=1
    echo -e >&2 "${blue}Generating starti coredump for $exe${reset}"
    "$bindir/gcore-starti" "$exe"
    echo -e >&2 "${blue}Generating main coredump for $exe${reset}"
    "$bindir/gcore-at" main "$exe"
  done
done

# TODO: add ld.so and GNU's ls
