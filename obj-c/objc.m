#import <Foundation/Foundation.h>

int sum(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int main(int argc, const char *argv[]) {
    int sumResult = sum(1, 2);
    NSLog(@"1 + 2 equals %d", sumResult);

    int subtractResult = subtract(1, 2);
    NSLog(@"1 - 2 equals %d", subtractResult);
    return 0;
}