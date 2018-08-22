CC ?= cc
RM ?= rm

all: hello

hello: test.c libtest.so
	$(CC) $(CFLAGS) -g -Wl,-rpath,\$$ORIGIN libtest.so -o hello test.c

libtest.so: libtest.c
	$(CC) $(CFLAGS) -fPIC -shared -Wl,--defsym=a=3 -o libtest.so libtest.c

.PHONY: clean
clean:
	$(RM) -f hello libtest.so
