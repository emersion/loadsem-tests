#!/bin/sh

set -e

build() {
	target="$1"

	echo >&2 "Building target $target (CC=\"$CC\", CLFAGS=\"$CFLAGS\")"
	CC="$CC" CFLAGS="$CFLAGS" make \
    && mv hello "hello-$target" \
    || echo >&2 "Failed to build target $target"
}

root=$(pwd)
arch_dir="$root/"$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)
src_dir="$root/src"

mkdir -p "$arch_dir"

for testcase in $(ls "$src_dir"); do
	cp -r "$src_dir/$testcase" "$arch_dir"
	cd "$arch_dir/$testcase"

	make clean

	CC=gcc CFLAGS="-fuse-ld=bfd" build gcc-bfd
	CC=clang CFLAGS="-fuse-ld=bfd" build clang-bfd
	CC=musl-gcc CFLAGS="-no-pie" build musl-gcc # fails woithout -no-pie
	CC=musl-clang CFLAGS="" build musl-clang
	CC=clang CFLAGS="-fuse-ld=lld" build lld
	CC=gcc CFLAGS="-fuse-ld=gold" build gold
done

