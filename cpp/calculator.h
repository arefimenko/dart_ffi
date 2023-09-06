#ifdef __cplusplus
extern "C" {
#endif

typedef void (*IntCallback)(int);

struct Calculator;

struct Calculator *createCalc(IntCallback callback);

struct Calculator *createCalcWithInitialValue(int initial, IntCallback callback);

void add(Calculator *calc, int a);

void subtract(Calculator *calc, int a);

void divide(Calculator *calc, int a);

void multiply(Calculator *calc, int a);

int getResult(Calculator *calc);

#ifdef __cplusplus
}
#endif
