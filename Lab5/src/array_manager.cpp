#include <random>
#include <iostream>
#include <omp.h>
#include <tuple>
#include <ctime>
#include "array_manager.h"

using namespace std;

random_device rd;
mt19937 gen(rd());

int **create_array(int ROWS, int COLS) {
    int **arr = new int *[ROWS];
    for (int i = 0; i < ROWS; i++) {
        arr[i] = new int[COLS];
    }

    return arr;
}

int generate_number(int lower_bound, int upper_bound) {
    uniform_int_distribution<> dis(lower_bound, upper_bound);
    return dis(gen);
}

void fill_array_randomly(int ROWS, int COLS, int **arr) {
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            arr[i][j] = generate_number(-1000, 1000);
        }
    }
}

void deallocate_memory(int ROWS, int **arr) {
    for (int i = 0; i < ROWS; i++) {
        delete[] arr[i];
    }
    delete[] arr;
}