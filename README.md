# js_ffi

Example of Dart and JavaScript interoperability using FFI.

## Pre requirements

add `js` package to `pubspec.yaml`:

```yaml
dependencies:
  js: ^0.6.1
```

or run

```shell
flutter pub add js
```

## Dart interop

```dart
import 'package:js/js.dart' as js;

@js.JS('helloFromDart')
external set _helloFromDartJsFunction(void Function() f);

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
```

## JavaScript interop

```dart
import 'package:js/js.dart' as js;

/// Calls `alert(message)` from JavaScript.
@js.JS('alert')
external void alert(String message);

/// Calls `console.log(data)` from JavaScript.
@js.JS('console.log')
external void consoleLog(Object? data);
```
