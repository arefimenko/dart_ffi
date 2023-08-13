#include "cpp_examples.h"
#include <iostream>

void printChar(const char *c) {
    std::cout << c << std::endl;
}

float arraySum(const float *arr) {
    float sum = 0;
    for (int i = 0; i < 3; i++) {
        sum += arr[i];
    }
    return sum;
}

char *getChar() {
    char *c = new char[10];
    for (int i = 0; i < 10; i++) {
        c[i] = 'a' + i;
    }
    return c;
}