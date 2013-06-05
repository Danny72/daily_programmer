#include <stdio.h>
#include <stdlib.h>

void main(char argc, char** argv) {
  int lista[] = {692, 1, 32};
  int listb[] = {0, 0, 0, 14, 15, 123, 2431};
  int i = 0;

  for (i=0;i<sizeof(lista)/sizeof(lista[0]);i++) {
    listb[i] = lista[i];
  }

  int size = sizeof(listb)/sizeof(listb[0]);

  for (i=0;i<size;i++) {
    printf("%d ", listb[i]);
  }
  puts("");
  
  int swap = 0;
  int temp;

  do {
    swap = 0;
    for (i=1;i<size;i++) {
      if (listb[i-1] > listb[i]) {
        temp = listb[i-1];
        listb[i-1] = listb[i];
        listb[i] = temp;
        swap = 1;
      } 
    }
  } while (swap == 1);

  for (i=0;i<sizeof(listb)/sizeof(listb[0]);i++) {
    printf("%d ", listb[i]);
  }
  puts("");
}
