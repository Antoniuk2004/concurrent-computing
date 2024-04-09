#include <random>
#include <iostream>
#include <omp.h>
#include <tuple>
#include <ctime>
#include "utils.h"

using namespace std;

long long find_sum_of_one_row(int **arr, int length, int row_index) {
    long long sum = 0;

    for (int col_index = 0; col_index < length; col_index++) {
        sum += arr[row_index][col_index];
    }

    return sum;
}

long long find_overall_sum(int **arr, int ROWS, int COLS) {
    int overall_sum = 0;

    for (int i = 0; i < ROWS; i++) {
        overall_sum += find_sum_of_one_row(arr, COLS, i);
    }

    return overall_sum;
}

tuple<long long, int> find_min_sum_row(int **arr, int ROWS, int COLS) {
    long long min_sum = numeric_limits<int>::max();
    int min_sum_row_index = 0;

    for (int i = 0; i < ROWS; i++) {
        long long one_row_sum = find_sum_of_one_row(arr, COLS, i);

        if (one_row_sum < min_sum) {
            min_sum = one_row_sum;
            min_sum_row_index = i;
        }
    }

    return tuple<int, int>(min_sum, min_sum_row_index);
}

long long find_overall_sum_omp(int **arr, int ROWS, int COLS, int THREADS) {
    long long sum = 0;
#pragma omp parallel for reduction(+ : sum) num_threads(THREADS)
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            sum += arr[i][j];
        }
    }

    return sum;
}

tuple<long long, int> find_min_sum_row_omp(int **arr, int ROWS, int COLS, int THREADS) {
    long long min_sum = numeric_limits<int>::max();
    int min_sum_row_index = 0;

#pragma omp parallel for shared(min_sum, min_sum_row_index) num_threads(THREADS)
    for (int i = 0; i < ROWS; i++) {
        long long one_row_sum = find_sum_of_one_row(arr, COLS, i);

        if (one_row_sum < min_sum) {
#pragma omp critical
            if (one_row_sum < min_sum) {
                min_sum = one_row_sum;
                min_sum_row_index = i;
            }
        }
    }

    return make_tuple(min_sum, min_sum_row_index);
}
