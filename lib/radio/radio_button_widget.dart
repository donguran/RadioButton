import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_group_widget.dart';
import 'package:radio_button/radio/radio_orientation.dart';

/// same [groupId]
class RadioButton<T> extends StatefulWidget {
  RadioButton({
    super.key,
    this.groupId,
    required this.value,
    required this.mainTitle,
    this.subTitle,
    this.onChanged,
    this.enabled = true,
    this.selectedIcon,
    this.unselectedIcon,
    this.iconColor = Colors.blueAccent,
    this.radioHighLightColor,
    this.entireTouchable = false,
    this.padding,
  });

  /// if you setting RadioButton's [groupId]
  /// unselected when RadioButton's value do not matched [groupId],
  /// selected when RadioButton's value matched [groupId].
  ///
  /// priority properties [radioGroupProvider] > [groupId]
  final T? groupId;

  /// RadioButton's identify [value].
  final T value;
  final Widget? mainTitle;
  final Widget? subTitle;

  /// radio button [enabled]
  final bool enabled;

  /// default icon:Icon(Icons.radio_button_on_outlined)
  final Icon? selectedIcon;

  /// default icon:Icon(Icons.radio_button_off_outlined)
  final Icon? unselectedIcon;

  final Color iconColor;

  /// if you want change radioButton pressed color.
  /// you should change this [radioHighLightColor].
  final Color? radioHighLightColor;

  /// if [entireTouchable] is true, it can possible pressed RadioButton Widget.
  /// but if it was false, it can only pressed RadioButton Icon Widget.
  final bool entireTouchable;

  final Function(dynamic value)? onChanged;

  final EdgeInsetsGeometry? padding;

  RadioGroupProvider? radioGroupProvider;

  @override
  State<RadioButton<T>> createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>> {
  RadioGroupProvider? radioGroupProvider;
  late RadioOrientation orientation;
  Color? iconColor;

  @override
  void initState() {
    super.initState();

    debugPrint("[RadioButton].. initState..");
    radioGroupProvider = widget.radioGroupProvider;
    orientation = radioGroupProvider?.orientation ?? RadioOrientation.vertical;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioButton].. build..");
    return orientation == RadioOrientation.vertical
        ? _verticalRadioButton()
        : _horizontalRadioButton();
  }

  /// [RadioOrientation.horizontal]
  Widget _verticalRadioButton() {
    debugPrint("_verticalRadioButton..");
    return radioButtonBase();
  }

  /// it this RadioButton do not used in RadioGroup
  /// Flex Widget will make hasSize Error
  Widget _horizontalRadioButton() {
    debugPrint("_horizontalRadioButton..");
    return Expanded(child: radioButtonBase());
  }

  Widget radioButtonBase() {
    return InkWell(
      onTap: widget.entireTouchable ? () {
        radioGroupProvider?.change(widget.value);
      } : null,
      child: ListTile(
        leading: IconButton(
          icon: radioGroupProvider != null
              ? iconExistRadioGroupProvider()
              : iconNotExistRadioGroupProvider(),
          onPressed: !widget.entireTouchable ? () {
            radioGroupProvider?.change(widget.value);
            if (widget.onChanged != null) {
              widget.onChanged!(widget.value);
            }
          } : null,
          highlightColor: widget.radioHighLightColor,
          color: widget.iconColor,
          disabledColor: widget.iconColor,
        ),
        title: widget.mainTitle,
        subtitle: widget.subTitle,

        contentPadding: widget.padding,
      ),
    );
  }

  Widget iconExistRadioGroupProvider() {
    return ListenableBuilder(
      listenable: radioGroupProvider!,
      builder:(context, child) => radioGroupProvider!.isEqual(widget.value)
          ? selectedIconWidget()
          : unselectedIconWidget(),
    );
  }

  Widget iconNotExistRadioGroupProvider() {
    return widget.groupId != null
        ? widget.groupId! == widget.value
          ? selectedIconWidget()
          : unselectedIconWidget()
        : unselectedIconWidget();
  }

  Icon selectedIconWidget() {
    return widget.selectedIcon ?? const Icon(Icons.radio_button_on_outlined,);
  }

  Icon unselectedIconWidget() {
    return widget.unselectedIcon ?? const Icon(Icons.radio_button_off_outlined);
  }
}
