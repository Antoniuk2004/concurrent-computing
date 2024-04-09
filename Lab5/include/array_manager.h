#ifndef ARRAY_MANAGER_H
#define ARRAY_MANAGER_H

int **create_array(int ROWS, int COLS);

int generate_number(int lower_bound, int upper_bound);

void fill_array_randomly(int ROWS, int COLS, int **arr);

void deallocate_memory(int ROWS, int **arr);

#endif