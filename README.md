# loadsem-tests

Collection of tests coredumps for the dynamic linker part of [linksem][1].

## Usage

Using this repository typically involves multiple steps.

First some executables and coredumps should be generated.

All built files will be stored in a per-architecture directory (e.g.
`linux-x86_64/`). By default the script will try to generate binaries with
different compilers and linkers.

- Build test cases: `./build.sh`
- Generate coredumps: `./gcore.sh`

Coredumps can be generated manually and copied over instead of using these
automated scripts.

Then, coredump files can be checked by loadsem. `<arch>` should be an
architecture directory. `[root]` should be specified if checking coredumps for
another architecture (checking a coredump requires having access to the
filesystem it has been generated on).

```shell
LOADSEM=/path/to/loadsem ./test.sh <arch> [root] | tee results.log
# For instance:
LOADSEM=/path/to/loadsem ./test.sh "linux-x86_64" ""
LOADSEM=/path/to/loadsem ./test.sh "freebsd-amd64" "~/tmp/qemu-freebsd-amd64/hda"
```

Log files will be created with test results for each coredump.

## License

BSD 2-Clause

[1]: https://github.com/rems-project/linksem
