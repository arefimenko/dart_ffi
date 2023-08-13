import 'dart:ffi' as ffi;

import 'package:dart_ffi/calculator.dart';
import 'package:dart_ffi/calculator_bindings.dart';

void calcCallback(int result) {
  print('calc: $result');
}

void main() {
  final calcDynamicLibrary = calculatorDynamicLibrary();
  final calcBindings = CalculatorBindings(calcDynamicLibrary);
  final callbackPointer = ffi.Pointer.fromFunction<ffi.Void Function(ffi.Int)>(calcCallback);
  final calc = calcBindings.createCalc(callbackPointer);
  calcBindings
    ..add(calc, 123)
    ..subtract(calc, 11)
    ..multiply(calc, 13)
    ..divide(calc, 2);
}
