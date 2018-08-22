# loadsem-tests

Collection of tests coredumps for the dynamic linker part of [linksem][1].

## Usage

Using this repository typically involves multiple steps.

First some executables and coredumps should be generated. A collection of these
artifacts for various architectures are published as [GitHub releases][2].

All built files will be stored in a per-architecture directory (e.g.
`linux-x86_64/`). By default the script will try to generate binaries with
different compilers and linkers.

- Build test cases: `./build.sh`
- Generate coredumps: `./gcore.sh`

Coredumps can be generated manually and copied over instead of using these
automated scripts.

Then, coredump files can be checked by loadsem:

```shell
LOADSEM=/path/to/loadsem ./test.sh | tee results.log
```

Log files will be created with test results for each coredump.

## License

BSD 2-Clause

[1]: https://github.com/rems-project/linksem
[2]: https://github.com/emersion/loadsem-tests
