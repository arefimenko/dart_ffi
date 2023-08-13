#ifdef __cplusplus
extern "C" {
#endif

typedef void (*IntCallback)(int);

typedef struct Calculator {
    int result;
    IntCallback resultCallback;
} Calculator;

struct Calculator *createCalc(IntCallback callback);

struct Calculator *createCalcWithInitialValue(int initial, IntCallback callback);

void add(struct Calculator *calc, int a);

void subtract(struct Calculator *calc, int a);

void divide(struct Calculator *calc, int a);

void multiply(struct Calculator *calc, int a);

int getResult(struct Calculator *calc);

#ifdef __cplusplus
}
#endif
