import 'dart:ffi' as ffi;
import 'dart:io' as io show Directory, Platform;

import 'package:path/path.dart' as path;

ffi.DynamicLibrary cppExamplesDynamicLibrary() {
  var libName = 'libcpp_examples.so';
  if (io.Platform.isMacOS) libName = 'libcpp_examples.dylib';
  if (io.Platform.isWindows) libName = 'libcpp_examples.dll';
  return ffi.DynamicLibrary.open(
    path.join(io.Directory.current.path, 'cpp_examples', libName),
  );
}
