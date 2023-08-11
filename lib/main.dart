import 'package:flutter/material.dart';

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
      home: const StubScreen(),
    );
  }
}

class StubScreen extends StatelessWidget {
  const StubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
