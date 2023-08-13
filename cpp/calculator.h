#ifdef __cplusplus
extern "C" {
#endif

typedef void (*IntCallback)(int);

class Calculator {
    int result;
    IntCallback resultCallback;

public:
    explicit Calculator(IntCallback callback) {
        resultCallback = callback;
        result = 0;
    }

    explicit Calculator(int initialResult, IntCallback callback) {
        resultCallback = callback;
        result = initialResult;
    }

    void add(int a) { resultCallback(result += a); }

    void subtract(int a) { resultCallback(result -= a); }

    void divide(int a) { resultCallback(result /= a); }

    void multiply(int a) { resultCallback(result *= a); }

    int getResult() const { return result; }
};

Calculator *createCalc(IntCallback callback);

Calculator *createCalcWithInitialValue(int initial, IntCallback callback);

void add(Calculator *calc, int a);

void subtract(Calculator *calc, int a);

void divide(Calculator *calc, int a);

void multiply(Calculator *calc, int a);

int getResult(Calculator *calc);

#ifdef __cplusplus
}
#endif
