#include "calculator.h"

Calculator *createCalc(IntCallback callback) {
    struct Calculator *calc;
    calc->result = 0;
    calc->resultCallback = callback;
    return calc;
}

Calculator *createCalcWithInitialValue(int initial, IntCallback callback) {
    struct Calculator *calc;
    calc->result = initial;
    calc->resultCallback = callback;
    return calc;
}

void add(Calculator *calc, int a) { calc->resultCallback(calc->result += a); }

void subtract(Calculator *calc, int a) { calc->resultCallback(calc->result -= a); }

void divide(Calculator *calc, int a) { calc->resultCallback(calc->result /= a); }

void multiply(Calculator *calc, int a) { calc->resultCallback(calc->result *= a); }

int getResult(Calculator *calc) { return calc->result; }