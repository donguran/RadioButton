import 'package:flutter/material.dart';

void main() {
  runApp(const TestWidget());
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadioButton Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RadioButton"),
          centerTitle: true,
        ),
        body: Placeholder(),
      ),
    );
  }
}