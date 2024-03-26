import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_button_widget.dart';

class RadioGroup<T> extends StatefulWidget {
  const RadioGroup({
    super.key,
    required this.groupId,
    required this.children
  });

  final T groupId;
  final List<Widget> children;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {

  @override
  void initState() {
    super.initState();

    if (widget.children is List<RadioButton>) {
      for (RadioButton item in (widget.children as List<RadioButton>)) {
        item.groupId = widget.groupId;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children,
    );
  }
}
