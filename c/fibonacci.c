#include "fibonacci.h"

int recursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return linear(n - 1) + linear(n - 2);
}

int linear(int n) {
    int n0 = 0, n1 = 1, aux;

    for (int i = 0; i < n; i++) {
        aux = n0;
        n0 = n1;
        n1 += aux;
    }

    return n0;
}
