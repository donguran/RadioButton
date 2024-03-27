import 'package:example/helper_widget/title_box_widget.dart';
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
  late RadioSampleGroupId groupId;
  String groupIdStr = "groupIdStr";

  @override
  void initState() {
    super.initState();

    groupId = RadioSampleGroupId.radio1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleBoxWidget("Vertical"),
        RadioGroup(
          groupId: groupId,
          orientation: RadioOrientation.vertical,
          children: [
            RadioButton(value: RadioSampleGroupId.radio1, content: const Text("radio1")),
            RadioButton(value: RadioSampleGroupId.radio2, content: const Text("radio2")),
            RadioButton(value: RadioSampleGroupId.radio3, content: const Text("radio3"),
            ),
          ],
        ),
        const Divider(),
        const TitleBoxWidget("Horizontal"),
        RadioGroup(
          onChanged: (value) {
            debugPrint(value.toString());
          },
          groupId: groupId,
          children: [
            RadioButton(value: RadioSampleGroupId.radio1, content: const Text("1"),),
            RadioButton(value: RadioSampleGroupId.radio2, content: const Text("2"),),
            RadioButton(value: RadioSampleGroupId.radio3, content: const Text("3"),),
            RadioButton(value: RadioSampleGroupId.radio4, content: const Text("4"),),
            RadioButton(value: RadioSampleGroupId.radio5, content: const Text("5"),),
          ],
        ),

        const Divider(),
        const TitleBoxWidget("Multi"),
        Column(
          children: [
            RadioGroup(
              groupId: groupIdStr,
              children: [
                RadioButton(value: "radio1", content: const Text("Radio1")),
                RadioButton(value: "radio2", content: const Text("Radio2")),
              ],
            ),
            RadioGroup(
              groupId: groupIdStr,
              children: [
                RadioButton(value: "radio3", content: const Text("Radio3")),
                RadioButton(value: "radio4", content: const Text("Radio4")),
                RadioButton(value: "radio5", content: const Text("Radio5")),
              ]
            )
          ],
        )
      ],
    );
  }
}

enum RadioSampleGroupId {
  radio1,
  radio2,
  radio3,
  radio4,
  radio5,
}