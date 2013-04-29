#include <stdio.h>
#include <stdlib.h>

void main(int argc, char **argv) {

  FILE *fp;
  int char_read; 
  char *filename = *(argv+1);
  char *format = *(argv+2);
  fp = fopen(filename, "r");

  if (fp == NULL) {
    printf("File not found\n");
    exit(0);
  } 

  do {
    char_read = fgetc(fp);
    if ((strcmp(format,"windows")==0) && (char_read == 10)) {
      printf("\\r\\n");
    }
    if ((strcmp(format,"unix")==0) && (char_read == 13)) {
      fgetc(fp);
      printf("\\n");
    }
    printf("%c", char_read);
  } while(char_read != EOF); 
  fclose(fp);
}
