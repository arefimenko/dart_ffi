import 'package:js/js.dart' as js;

@js.JS('helloFromDart')
external set _helloFromDartJsFunction(void Function() f);

// ignore: avoid_print
void _helloFromDart() => print('Hello from Dart!');

@js.JS('dartAdd')
external set _addJsFunction(void Function(num first, num second) f);

num _dartAdd(num first, num second) => first + second;

/// Creates Dart interop to call Dart functions from JavaScript.
///
/// JavaScript code may now call:
///   1. `helloFromDart()` or `window.helloFromDart()` to invoke [_helloFromDart].
///   2. `dartAdd(1, 2)` or `window.dartAdd(1, 2)` to invoke [_dartAdd].
void initialize() {
  _helloFromDartJsFunction = js.allowInterop(_helloFromDart);
  _addJsFunction = js.allowInterop(_dartAdd);
}
