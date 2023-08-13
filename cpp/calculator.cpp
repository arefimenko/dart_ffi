#include "calculator.h"

Calculator *createCalc(IntCallback callback) {
    return new Calculator(callback);
}

Calculator *createCalcWithInitialValue(int initial, IntCallback callback) {
    return new Calculator(initial, callback);
}

void add(Calculator *calc, int a) { calc->add(a); }

void subtract(Calculator *calc, int a) { calc->subtract(a); }

void divide(Calculator *calc, int a) { calc->divide(a); }

void multiply(Calculator *calc, int a) { calc->multiply(a); }

int getResult(Calculator *calc) { return calc->getResult(); }