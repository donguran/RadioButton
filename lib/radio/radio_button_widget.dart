import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_group_widget.dart';
import 'package:radio_button/radio/radio_orientation.dart';

class RadioButton<T> extends StatelessWidget {
  RadioButton({
    super.key,
    this.groupId,
    required this.value,
    required this.mainTitle,
    this.subTitle,
    this.radioGroupProvider,
    this.selectedIcon,
    this.unselectedIcon,
    this.radioHighLightColor
  }) {
    debugPrint("RadioButton 생성");
  }

  T? groupId;
  final T value;
  final Widget? mainTitle;
  final Widget? subTitle;
  RadioGroupProvider? radioGroupProvider;

  /// default icon:Icon(Icons.radio_button_on_outlined)
  Icon? selectedIcon;

  /// default icon:Icon(Icons.radio_button_off_outlined)
  Icon? unselectedIcon;

  /// if you want change radioButton pressed color.
  /// you should change this [radioHighLightColor].
  Color? radioHighLightColor;

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioButton].. build..");
    return radioGroupProvider?.orientation == RadioOrientation.vertical
        ? _verticalRadioButton()
        : _horizontalRadioButton();
  }

  /// [RadioOrientation.horizontal]
  Widget _verticalRadioButton() {
    debugPrint("_verticalRadiOButton............");
    return ListTile(
      leading: IconButton(
        icon: radioGroupProvider != null
            ? ListenableBuilder(
          listenable: radioGroupProvider!,
          builder:(context, child) => radioGroupProvider!.isEqual(value)
              ? _selectedIconWidget()
              : _unselectedIconWidget(),
        )
            : _unselectedIconWidget(),
        onPressed: () {
          radioGroupProvider?.change(value);
        },
        highlightColor: radioHighLightColor,
      ),
      title: mainTitle,
      subtitle: subTitle,
    );
  }

  Widget _horizontalRadioButton() {
    debugPrint("_horizontalRadiOButton............");
    return Expanded(
      child: ListTile(
        leading: IconButton(
          icon: radioGroupProvider != null
              ? ListenableBuilder(
            listenable: radioGroupProvider!,
            builder:(context, child) => radioGroupProvider!.isEqual(value)
                ? _selectedIconWidget()
                : _unselectedIconWidget(),
          )
              : _unselectedIconWidget(),
          onPressed: () {
            radioGroupProvider?.change(value);
          },
          highlightColor: radioHighLightColor,
        ),
        title: mainTitle,
        subtitle: subTitle,
      ),
    );
  }

  Icon _selectedIconWidget() {
    return selectedIcon ?? const Icon(Icons.radio_button_on_outlined,);
  }

  Icon _unselectedIconWidget() {
    return unselectedIcon ?? const Icon(Icons.radio_button_off_outlined);
  }
}
