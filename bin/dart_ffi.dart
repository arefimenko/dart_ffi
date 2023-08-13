import 'package:dart_ffi/objc_bindings.dart' as objc_bindings;

void main() {
  final objCBindings = objc_bindings.ObjCBindings();
  print('--- ObjCBindings ---');
  print('sum(1, 2) == ${objCBindings.sum(1, 2)}');
  print('subtract(11, -11) == ${objCBindings.subtract(11, -11)}');
}
