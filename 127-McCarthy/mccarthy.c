#include <stdio.h>
#include <stdlib.h>

int mccarthy91(int input);

void main(char argc, char* argv[]) {
  int input = atoi(argv[1]);
 
  if (input == NULL || input < 1) {
    puts("input is not valid");
    exit(0);
  }

  printf("M(%d)\n", input);
  printf("%d\n", mccarthy91(input));
}

int mccarthy91(int input) {
  if (input > 100) {
    printf("M(%d) since %d is greater than 100\n", input-10, input);
    return input - 10;
  } else {
    printf("M(M(%d)) since %d is less than or equal to 100\n", input+11, input);
    return mccarthy91(mccarthy91(input + 11));
  }
}
