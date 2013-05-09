#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//run with ./sync m n e.g. 38 470

void main(int argc, char *argv[]) {
  int julian = (int) (floor(strtod(argv[1],NULL)*365.25));
  int lunar = (int)((strtod(argv[2], NULL)*29.53059) + 0.5); 
  if (julian == lunar) {
    printf("%d\n", julian);
  } else {
    printf("%d\n", 0);
  }

  int i;
  int y;

  for (i=0;i<500;i++) {
    for (y=0;y<15000;y++) {
      if ((int) (floor((double)(i)*365.25)) == ((int) ((y * 29.53059)+0.5))) {
        printf("%d:%d\n", i, y);
      }
    }
  }
}
