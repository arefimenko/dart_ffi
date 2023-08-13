import 'dart:ffi' as ffi;
import 'dart:io' as io show Directory, stdout, Platform;

import 'package:path/path.dart' as path;

typedef _NativeFibonacci = ffi.Int32 Function(ffi.Int32);
typedef _DartFibonacci = int Function(int);

/// Fibonacci sequence Dart FFI example
class Fibonacci {
  late final _DartFibonacci _linearNative;
  late final _DartFibonacci _recursiveNative;

  Fibonacci() {
    var libName = 'libfibonacci.so';
    if (io.Platform.isMacOS) libName = 'libfibonacci.dylib';
    if (io.Platform.isWindows) libName = 'libfibonacci.dll';
    final fibonacciLib = ffi.DynamicLibrary.open(
      path.join(io.Directory.current.path, 'c', libName),
    );
    _linearNative = fibonacciLib.lookupFunction<_NativeFibonacci, _DartFibonacci>('linear');
    _recursiveNative = fibonacciLib
        .lookup<ffi.NativeFunction<_NativeFibonacci>>('recursive')
        .asFunction<_DartFibonacci>();
  }

  /// Execute all Fibonacci functions for [n]'s element.
  void executeAllFor(int n) {
    void execute(Function() func, String name) {
      final sw = Stopwatch()..start();
      func();
      sw.stop();
      io.stdout.writeln('${name.padLeft(15)}: ${sw.elapsedMicroseconds}');
    }

    io.stdout.writeln("fibonacci for $n's element (execution time in microseconds)");
    execute(() => linear(n), 'linear');
    execute(() => linearNative(n), 'linearNative');
    execute(() => recursive(n), 'recursive');
    execute(() => recursiveNative(n), 'recursiveNative');
  }

  /// Recursive Fibonacci sequence execution.
  int recursive(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return recursive(n - 1) + recursive(n - 2);
  }

  /// Recursive Fibonacci sequence native execution.
  int recursiveNative(int n) => _recursiveNative(n);

  /// Linear Fibonacci sequence execution.
  int linear(int n) {
    var n0 = 0;
    var n1 = 1;
    int aux;

    for (var i = 0; i < n; i++) {
      aux = n0;
      n0 = n1;
      n1 += aux;
    }

    return n0;
  }

  /// Linear Fibonacci sequence native execution.
  int linearNative(int n) => _linearNative(n);
}
