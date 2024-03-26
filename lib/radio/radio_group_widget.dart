import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_button_widget.dart';

class RadioGroup<T> extends StatefulWidget {
  RadioGroup({
    super.key,
    required this.groupId,
    required this.children,
    this.onChanged
  }) {
    debugPrint("RadioGroup 생성");
  }

  final T groupId;
  final List<Widget> children;
  Function(dynamic value)? onChanged;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  late RadioGroupId radioGroupId;

  @override
  void initState() {
    super.initState();
    debugPrint("[RadioGroup].. initState..");

    radioGroupId = RadioGroupId._(
      radioGroupId: widget.groupId,
      onChanged: widget.onChanged
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioGroup].. build..");

    for (var item in widget.children) {
      if (item is RadioButton) {
        item.groupId = widget.groupId;
        item.radioGroupId = radioGroupId;
      }
    }
    return Column(
      children: widget.children,
    );
  }
}

class RadioGroupId<T> extends ChangeNotifier {
  RadioGroupId._({
    required this.radioGroupId,
    this.onChanged
  });

  T radioGroupId;
  Function(dynamic value)? onChanged;

  void change(T value) {
    radioGroupId = value;
    if (onChanged != null) {
      onChanged!(value);
    }

    notifyListeners();
  }

  bool isEqual(T value) => radioGroupId == value;
}
