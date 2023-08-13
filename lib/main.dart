import 'package:dart_ffi/dart_interop.dart' as dart_interop;
import 'package:dart_ffi/js_interop.dart' as js_interop;
import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart FFI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JsFFIExamplesScreen(),
    );
  }
}

class JsFFIExamplesScreen extends StatefulWidget {
  const JsFFIExamplesScreen({super.key});

  @override
  State<JsFFIExamplesScreen> createState() => _JsFFIExamplesScreenState();
}

class _JsFFIExamplesScreenState extends State<JsFFIExamplesScreen> {
  @override
  void initState() {
    dart_interop.initialize();
    js_interop.consoleLog('console.log(...) called from Dart');
    /* Future.delayed added to prevent app loading freezing during showing alert(...) */
    Future<void>.delayed(
      Duration.zero,
      () => js_interop.alert('alert message from Dart\ncurrent time is ${DateTime.now()}'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EquationTextWidget(
                formulation: '1 + \'2\'',
                result: js_util.add(1, '2'),
              ),
              _EquationTextWidget(
                formulation: '1 - \'2\'',
                result: js_util.subtract(1, '2'),
              ),
              _EquationTextWidget(
                formulation: '0.5 + 0.1 == 0.6',
                result: js_util.equal(js_util.add(0.5, 0.1), 0.6),
              ),
              _EquationTextWidget(
                formulation: '0.1 + 0.2 == 0.3',
                result: js_util.equal(js_util.add(0.1, 0.2), 0.3),
              ),
              _EquationTextWidget(
                formulation: '[] + []',
                result: js_util.add([], []),
              ),
              _EquationTextWidget(
                formulation: 'true + true + true === 3',
                result: js_util.strictEqual(js_util.add(js_util.add(true, true), true), 3),
              ),
              _EquationTextWidget(
                formulation: '[] == 0',
                result: js_util.equal([], 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EquationTextWidget<T> extends StatelessWidget {
  final String formulation;
  final T result;

  const _EquationTextWidget({
    required this.formulation,
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$formulation is $result [${result.runtimeType}]',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
