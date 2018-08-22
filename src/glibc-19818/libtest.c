extern char a __attribute__((weak));

char *x(void) {
  return &a;
}
