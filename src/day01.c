#include <stdint.h>
#include <stdio.h>

// math mod e=[0 > n]
uint8_t mod(int i, int n) { return ((i % n) + n) % n; }

uint32_t solve_part_one() {
  FILE *fp;
  uint8_t current = 50;
  uint32_t password = 0;

  fp = fopen("inputs/day01", "r");
  if (fp == NULL) {
    perror("Unable to read file\n");
    return 1;
  }

  char direction;
  int ticks;
  printf("%d ", current);
  while (fscanf(fp, "%c%d\n", &direction, &ticks) == 2) {
    if (direction == 'L') {
      ticks *= -1;
    }

    current = mod(current + ticks, 100);
    if (current == 0)
      password++;
    printf("%d ", current);
  }

  printf("\n\npassword: %d\n ", password);
  return password;
}

int main() {
  solve_part_one();
  return 0;
}
