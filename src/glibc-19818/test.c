#include <stdio.h>

char *x(void);

int main(void) {
  printf("a: %p\n", x());
  return 0;
}
