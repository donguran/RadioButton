import 'package:flutter/material.dart';
import 'package:radio_button/radio_button.dart';

void main() {
  runApp(const TestWidget());
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  String groupId = "groupId";
  
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
          title: const Text("KG RadioButton"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("groupId:$groupId"),
            RadioGroup(
              onChanged: (value) {
                debugPrint("value.............:$value");
                setState(() {
                  groupId = value;
                });
              },
              groupId: groupId,
              children: [
                RadioButton(value: "TEST1", mainTitle: Text("test1")),
                RadioButton(value: "TEST2", mainTitle: Text("test2"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}