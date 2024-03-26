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
        body: radioWidget(),
      ),
    );
  }

  Widget test() {
    return Column(
      children: [
        Text("test"),
        Row(
          children: [
            Flexible(child: ListTile(
              title: Text("test1"),
              leading: Icon(Icons.add),
              subtitle: Text("sub"),
            )),
            Flexible(child: ListTile(title: Text("test1"), )),
            Flexible(child: ListTile(title: Text("test1"), )),
            Flexible(child: ListTile(title: Text("test1"), )),
          ],
        ),
      ],
    );
  }

  Widget radioWidget() {
    return Column(
      children: [
        Text("groupId:$groupId"),
        RadioGroup(
          onChanged: (value) {
            debugPrint("value.............:$value");
            groupId = value;
          },
          orientation: RadioOrientation.vertical,
          groupId: groupId,
          children: [
            RadioButton(value: "TEST1", mainTitle: Text("test1")),
            RadioButton(value: "TEST2", mainTitle: Text("test2")),
            RadioButton(value: "TEST3", mainTitle: Text("test3"),
              selectedIcon: Icon(Icons.check_box),
            ),
          ],
        ),
      ],
    );
  }
}