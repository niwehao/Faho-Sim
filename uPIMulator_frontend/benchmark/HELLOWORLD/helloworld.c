
#include "stdsys.h"

int main(void) {
  int sd = socket_open(0); // open stdout like
  int err = 0;
  if (sd < 0)
    return sd;
  if ((err = socket_write(sd, "Hello world!\n", 14)) < 0)
    return err;
  return 0;
}