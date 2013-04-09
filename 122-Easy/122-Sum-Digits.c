#include <stdio.h>

void main(int argc, char *argv[]) {

  int input = atoi(argv[1]);
  int result = 0;

  printf("input: %d\n",input);

  while (input) {
    result += input % 10;
    input /= 10;
    if (!input && (result % 10 != result)) {
      input = result;
      result = 0;
    } 
  }
  printf("digital root: %d\n",result);
}
