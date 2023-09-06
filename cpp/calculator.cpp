#include "calculator.h"

typedef struct Calculator {
    int result;
    IntCallback resultCallback;
} Calculator;

Calculator *createCalc(IntCallback callback) {
    Calculator *calc = new Calculator;
    calc->result = 0;
    calc->resultCallback = callback;
    return calc;
}

Calculator *createCalcWithInitialValue(int initial, IntCallback callback) {
    Calculator *calc = new Calculator;
    calc->result = initial;
    calc->resultCallback = callback;
    return calc;
}

void add(Calculator *calc, int a) { calc->resultCallback(calc->result += a); }

void subtract(Calculator *calc, int a) { calc->resultCallback(calc->result -= a); }

void divide(Calculator *calc, int a) { calc->resultCallback(calc->result /= a); }

void multiply(Calculator *calc, int a) { calc->resultCallback(calc->result *= a); }

int getResult(Calculator *calc) { return calc->result; }
