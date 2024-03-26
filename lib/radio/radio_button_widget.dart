import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_group_widget.dart';

class RadioButton<T> extends StatelessWidget {
  RadioButton({
    super.key,
    this.groupId,
    required this.value,
    required this.mainTitle,
    this.subTitle,
    this.radioGroupId
  }) {
    debugPrint("RadioButton 생성");
  }

  T? groupId;
  final T value;
  final Widget? mainTitle;
  final Widget? subTitle;
  RadioGroupId? radioGroupId;

  /// default icon:Icon(Icons.radio_button_on_outlined)
  Icon? selectedIcon;

  /// default icon:Icon(Icons.radio_button_off_outlined)
  Icon? unselectedIcon;

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioButton].. build..");
    return ListTile(
      splashColor: Colors.transparent,
      leading: IconButton(
        icon: radioGroupId != null
            ? radioGroupId!.isEqual(value)
              ? _selectedIconWidget()
              : _unselectedIconWidget()
            : _unselectedIconWidget(),
        onPressed: () {
          radioGroupId?.change(value);
        },
      ),
      title: mainTitle,
      subtitle: subTitle,
    );
  }

  Icon _selectedIconWidget() {
    return selectedIcon ?? const Icon(Icons.radio_button_on_outlined);
  }

  Icon _unselectedIconWidget() {
    return unselectedIcon ?? const Icon(Icons.radio_button_off_outlined);
  }
}
