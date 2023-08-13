import 'package:dart_ffi/java.dart';
import 'package:jni/jni.dart';
import 'package:path/path.dart' as path;

void main() {
  Jni.spawn(
    dylibDir: path.join('build', 'jni_libs'),
    classPath: ['java'],
  );
  print(JavaExample.sum(1, 2));
}
