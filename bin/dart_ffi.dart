import 'dart:ffi' as ffi;
import 'dart:io' as io;

import 'package:dart_ffi/objc_bindings.dart' as objc_bindings;
import 'package:dart_ffi/swift_bindings.dart' as swift_bindings;
import 'package:path/path.dart' as path;

void main() {
  final objCBindings = objc_bindings.ObjCBindings();
  print('--- ObjCBindings ---');
  print('sum(1, 2) == ${objCBindings.sum(1, 2)}');
  print('subtract(11, -11) == ${objCBindings.subtract(11, -11)}');

  assert(io.Platform.isMacOS, 'Supports macOS only');
  final lib = ffi.DynamicLibrary.open(
    path.join(io.Directory.current.path, 'swift', 'swift.dylib'),
  );
  final swiftBindings = swift_bindings.SwiftBindings(lib);
  final swiftClass = swift_bindings.SwiftClass.new1(swiftBindings);
  print('--- SwiftBindings ---');
  print(swiftClass.sayHello());
  print('someField = ${swiftClass.someField}');
  swiftClass.someField = 321;
  print('someField = ${swiftClass.someField}');
}
