#ifndef UTILS_H
#define UTILS_H

#include <tuple>
using namespace std;

long long find_sum_of_one_row(int **arr, int length, int row_index);

long long find_overall_sum(int **arr, int ROWS, int COLS);

tuple<long long, int> find_min_sum_row(int **arr, int ROWS, int COLS);

long long find_overall_sum_omp(int **arr, int ROWS, int COLS, int THREADS);

tuple<long long, int> find_min_sum_row_omp(int **arr, int ROWS, int COLS, int THREADS);

#endif