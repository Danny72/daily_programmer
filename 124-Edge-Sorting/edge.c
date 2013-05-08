#include <stdio.h>

void bub_sort(int edges[][3], int e_num);
void print(int edges[][3], int e_num);

void main(int argc, char **argv) {

  int e_num = 6;
  int edges[][3] = {{70,2,3},{66,1,2},{68,6,5},{67,6,7},{69,5,4},{65,3,4}};
  print(edges, e_num);  
  bub_sort(edges,e_num);
  print(edges, e_num);
}

void bub_sort(int edges[][3], int e_num) {

  int i;
  int y;
  int temp;
  int swap;
  int lowest;

  do { 
    swap = 0;
    for (i = 0; i < e_num - 1; i++) {
      if (edges[i+1][1] < edges[i+1][2]) {
        lowest = edges[i+1][1];
      } else {
        lowest = edges[i+1][2];
      }
      if (edges[i][1] > lowest) {
        for (y = 0; y < 3; y++) {
          temp = edges[i][y];
          edges[i][y] = edges[i+1][y];
          edges[i+1][y] = temp;
          swap = 1;
        }
      }
    }
  } while (swap == 1);

}

void print(int edges[][3], int e_num) {
  
  int i;
  int y;

  for (i = 0; i < e_num; i++) {
    printf("%c ", edges[i][0]);
  }
  printf("\n");
}
