import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '税计算器',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
class FirstNumber extends StatefulWidget {
  const FirstNumber({Key? key}) : super(key: key);

  @override
  State<FirstNumber> createState() => _FirstNumberState();
}

class _FirstNumberState extends State<FirstNumber> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


int calculate() {
  return 6 * 7;
}
