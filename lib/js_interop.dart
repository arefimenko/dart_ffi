import 'package:js/js.dart' as js;

/// Calls `alert(message)` from JavaScript.
@js.JS('alert')
external void alert(String message);

/// Calls `console.log(data)` from JavaScript.
@js.JS('console.log')
external void consoleLog(Object? data);
