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
          onChanged: (value) {
            debugPrint("RadioGroup result:$value");
          },
          groupId: groupId,
          orientation: RadioOrientation.vertical,
          children: [
            RadioButton(value: RadioSampleGroupId.radio1, mainTitle: const Text("radio1")),
            RadioButton(value: RadioSampleGroupId.radio2, mainTitle: const Text("radio2")),
            RadioButton(
              value: RadioSampleGroupId.radio3,
              mainTitle: const Text("radio3"),
              entireTouchable: true,
            ),
          ],
        ),
        const Divider(),
        const TitleBoxWidget("Horizontal"),
        RadioGroup(
          groupId: groupId,
          children: [
            RadioButton(value: RadioSampleGroupId.radio1, mainTitle: const Text("radio1"),),
            RadioButton(value: RadioSampleGroupId.radio2, mainTitle: const Text("radio1"),),
            RadioButton(value: RadioSampleGroupId.radio3, mainTitle: const Text("radio1"),),
            RadioButton(value: RadioSampleGroupId.radio4, mainTitle: const Text("radio1"),),
            RadioButton(value: RadioSampleGroupId.radio5, mainTitle: const Text("radio1"),),
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