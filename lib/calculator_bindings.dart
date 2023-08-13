import 'dart:ffi' as ffi;
import 'dart:io' as io show Directory, Platform;

import 'package:path/path.dart' as path;

ffi.DynamicLibrary calculatorDynamicLibrary() {
  var libName = 'libcalculator.so';
  if (io.Platform.isMacOS) libName = 'libcalculator.dylib';
  if (io.Platform.isWindows) libName = 'libcalculator.dll';
  return ffi.DynamicLibrary.open(
    path.join(io.Directory.current.path, 'cpp', libName),
  );
}
