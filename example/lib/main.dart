import 'package:flutter/material.dart';
import 'package:radio_button/radio_button.dart';

void main() {
  runApp(MaterialApp(
    title: 'RadioButton Example',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      useMaterial3: true,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("donguran RadioButton"),
        centerTitle: true,
      ),
      body: const RadioExample(),
    ),
  ));
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String groupId = "radio1";
  String groupId2 = "radio1";
  String groupId3 = "radio1";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("groupId:$groupId"),
        RadioGroup(
          groupId: "groupId",
          onChanged: (value) {
            setState(() {
              groupId = value;
            });
          },
          children: [
            RadioButton(value: "radio1", content: const Text("Radio1")),
            RadioButton(value: "radio2", content: const Text("Radio2")),
            RadioButton(value: "radio3", content: const Text("Radio3"))
          ],
        ),
        const Divider(),
        Text("groupId2:$groupId2"),
        RadioGroup(
          groupId: "groupId",
          onChanged: (value) {
            setState(() {
              groupId2 = value;
            });
          },
          children: [
            RadioButton(
              value: "radio1",
              content: const Text("Radio1"),
              entireTouchable: true,
            ),
            RadioButton(
              value: "radio2",
              content: const Text("Radio2"),
              entireTouchable: true,
            ),
            RadioButton(
              value: "radio3",
              content: const Text("Radio3"),
              entireTouchable: true,
            )
          ],
        ),
      ],
    );
  }
}
