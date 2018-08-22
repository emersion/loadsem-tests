CC ?= cc
RM ?= rm

all: hello

hello: main.c
	$(CC) -static $(CFLAGS) -g -o hello main.c

.PHONY: clean
clean:
	$(RM) -f hello

