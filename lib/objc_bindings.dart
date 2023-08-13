import 'dart:ffi' as ffi;
import 'dart:io' as io;

import 'package:path/path.dart' as path;

/// Dart function signature for the `sum` function.
typedef _SumFunction = int Function(int, int);

/// ObjC function signature for the `sum` function.
typedef _SumObjCFunction = ffi.Int32 Function(ffi.Int32, ffi.Int32);

/// Dart function signature for the `subtract` function.
typedef _SubtractFunction = int Function(int, int);

/// ObjC function signature for the `subtract` function.
typedef _SubtractObjCFunction = ffi.Int32 Function(ffi.Int32, ffi.Int32);

/// Dart bindings for the ObjC functions.
class ObjCBindings {
  late final _SumFunction _sum;
  late final _SubtractFunction _subtract;

  /// Creates a new instance of [ObjCBindings].
  ///
  /// Throws an [AssertionError] if the current platform is not macOS.
  ///
  /// Loads the `objc.dylib` library from the `obj-c` directory.
  ///
  /// Loads the `sum` and `subtract` functions from the library:
  ///   1. `sum` function is loaded using the `lookupFunction` method.
  ///   2. `subtract` function is loaded using the `lookup` method.
  ObjCBindings() {
    assert(io.Platform.isMacOS, 'Supports macOS only');
    final lib = ffi.DynamicLibrary.open(
      path.join(io.Directory.current.path, 'obj-c', 'objc.dylib'),
    );
    _sum = lib.lookupFunction<_SumObjCFunction, _SumFunction>('sum');
    _subtract = lib
        .lookup<ffi.NativeFunction<_SubtractObjCFunction>>('subtract')
        .asFunction<_SubtractFunction>();
  }

  /// Returns the sum of [a] and [b].
  int sum(int a, int b) => _sum(a, b);

  /// Returns the difference of [a] and [b].
  int subtract(int a, int b) => _subtract(a, b);
}
