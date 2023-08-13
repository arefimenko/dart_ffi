import 'dart:ffi' as ffi;

import 'package:dart_ffi/calculator.dart';
import 'package:dart_ffi/calculator_bindings.dart';
import 'package:dart_ffi/cpp_examples.dart';
import 'package:dart_ffi/cpp_examples_bindings.dart';
import 'package:dart_ffi/fibonacci.dart';
import 'package:ffi/ffi.dart' as p_ffi;

void calcCallback(int result) {
  print('calc: $result');
}

void main() {
  /* fibonacci */
  Fibonacci().executeAllFor(32);

  /* calculator */
  print('\n--- Calculator ---');
  final calcDynamicLibrary = calculatorDynamicLibrary();
  final calcBindings = CalculatorBindings(calcDynamicLibrary);
  final callbackPointer = ffi.Pointer.fromFunction<ffi.Void Function(ffi.Int)>(calcCallback);
  final calc = calcBindings.createCalc(callbackPointer);
  calcBindings
    ..add(calc, 123)
    ..subtract(calc, 11)
    ..multiply(calc, 13)
    ..divide(calc, 2);

  /* cpp_examples */
  print('\n--- String and array examples ---');
  final cppExamplesLib = cppExamplesDynamicLibrary();
  final examplesBindings = CppExamples(cppExamplesLib);

  final cChar = examplesBindings.getChar();
  print('char from C: ${cChar.cast<p_ffi.Utf8>().toDartString()}');

  final dartString = 'Hello from Dart';
  final charPointer = dartString.toNativeUtf8().cast<ffi.Char>();
  examplesBindings.printChar(charPointer);

  final floatPointer = p_ffi.malloc.allocate<ffi.Float>(
    ffi.sizeOf<ffi.Float>() * 3,
  );

  floatPointer[0] = 11.123;
  floatPointer[1] = -8.845;
  floatPointer[2] = 0.7763;

  print('sum of float array elements: ${examplesBindings.arraySum(floatPointer)}');

  p_ffi.malloc.free(floatPointer);
}
