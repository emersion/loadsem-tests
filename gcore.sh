#!/bin/sh

set -e

cd $(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)

root=$(pwd)

for testcase in hello-static hello-dynamic coreutils-ls glibc-19818; do
  cd "$root/$testcase"

  for exe in $(find . -type f); do
    if [ ! -x "$exe" ]; then
      continue
    fi
    export LD_BIND_NOW=1
    ./gcore-starti "$exe"
    ./gcore-at main "$exe"
  done
done

# TODO: add ld.so and GNU's ls
