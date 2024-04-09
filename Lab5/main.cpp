#include <random>
#include <iostream>
#include <tuple>
#include <ctime>
#include "include/array_manager.h"
#include "include/utils.h"

using namespace std;

int main(int argc, char const *argv[]) {
    const int ROWS = 10000;
    const int COLS = 10000;
    const int THREADS = 6;

    cout << "App started the array generation" << endl;
    int **arr = create_array(ROWS, COLS);
    fill_array_randomly(ROWS, COLS, arr);

    clock_t start = clock();
    long long overall_sum = find_overall_sum(arr, ROWS, COLS);
    tuple<long long, int> min_sum_row = find_min_sum_row(arr, ROWS, COLS);
    clock_t end = clock();

    cout << "Overall sum: " << overall_sum << endl;
    cout << "Min sum: " << get<0>(min_sum_row) << " in row: " << get<1>(min_sum_row) << endl;
    cout << "Time: " << (double) (end - start) / CLOCKS_PER_SEC << endl;

    start = clock();
    long long overall_sum_omp = find_overall_sum_omp(arr, ROWS, COLS, THREADS);
    tuple<long long, int> min_sum_row_omp = find_min_sum_row_omp(arr, ROWS, COLS, THREADS);
    end = clock();

    cout << "Overall sum using OpenMP: " << overall_sum_omp << endl;
    cout << "Min sum using OpenMP: " << get<0>(min_sum_row_omp) << " in row: "
         << get<1>(min_sum_row_omp) << endl;
    cout << "Time using OpenMP: " << (double) (end - start) / CLOCKS_PER_SEC << endl;

    deallocate_memory(ROWS, arr);

    return 0;
}