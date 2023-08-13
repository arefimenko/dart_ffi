import 'package:dart_ffi/java.dart' as bindings;
import 'package:jni/jni.dart' as jni;
import 'package:path/path.dart' as path;

void main() {
  jni.Jni.spawn(
    dylibDir: path.join('build', 'jni_libs'),
    classPath: ['java'],
  );
  print(bindings.JavaExample.sum(1, 2));
}
