import 'package:flutter/material.dart';

class RadioButton<T> extends StatelessWidget {
  RadioButton({
    super.key,
    this.groupId,
    required this.value,
    required this.mainTitle,
    this.subTitle,
  });

  T? groupId;
  final T value;
  final Widget? mainTitle;
  final Widget? subTitle;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      key: key,
      builder:(context, setState) => ListTile(
        leading: Radio<T>(
          onChanged: (value) {
            setState(() {
              groupId = value;
            });
          },
          groupValue: groupId,
          value: value,
        ),
        title: mainTitle,
        subtitle: subTitle,
      ),
    );
  }
}
