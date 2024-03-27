import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:radio_button/radio/radio_fit.dart';
import 'package:radio_button/radio/radio_group_widget.dart';
import 'package:radio_button/radio/radio_orientation.dart';

class RadioButton<T> extends StatefulWidget {
  RadioButton({
    super.key,
    this.groupId,
    required this.value,
    required this.content,
    this.onChanged,
    this.fit = RadioFit.match,
    this.width,
    this.height,
    this.decoration,
    this.enabled = true,
    this.selectedIcon,
    this.unselectedIcon,
    this.iconColor = Colors.blueAccent,
    this.radioHighLightColor,
    this.entireTouchable = false,
    this.padding,
    this.align = MainAxisAlignment.start,
  });

  /// if you setting RadioButton's [groupId]
  /// unselected when RadioButton's value do not matched [groupId],
  /// selected when RadioButton's value matched [groupId].
  ///
  /// priority properties [radioGroupProvider] > [groupId]
  final T? groupId;

  /// RadioButton's identify [value].
  final T value;

  /// [content] RadioButton main content
  final Widget? content;

  /// [width] RadioButton's width size
  final double? width;

  /// [height] RadioButton's height size
  final double? height;

  /// [decoration] RadioButton frame custom
  /// color, border, radius..
  final BoxDecoration? decoration;

  /// radio button [enabled]
  final bool enabled;

  /// [selectedIcon] default icon:Icon(Icons.radio_button_on_outlined)
  final Icon? selectedIcon;

  /// [unselectedIcon] default icon:Icon(Icons.radio_button_off_outlined)
  final Icon? unselectedIcon;

  /// [iconColor] RadioButton Icon's default Color setting.
  final Color iconColor;

  /// if you want change radioButton pressed color.
  /// you should change this [radioHighLightColor].
  final Color? radioHighLightColor;

  /// if [entireTouchable] is true, it can possible pressed RadioButton Widget.
  /// but if it was false, it can only pressed RadioButton Icon Widget.
  final bool entireTouchable;

  /// If you need individual RadioButton's onChanged actions.
  /// use this [onChanged]
  ///
  /// but If you use RadioButton into RadioGroup.
  /// you don't use this RadioButtons' [onChanged]
  /// use RadioGroup's [RadioGroup.onChanged] method.
  final Function(dynamic value)? onChanged;

  /// [padding] widgets in RadioButton
  /// return type [EdgeInsetsGeometry]
  final EdgeInsetsGeometry? padding;

  /// [align] widgets in RadioButton
  final MainAxisAlignment align;

  /// [fit] is default : [RadioFit.match]
  /// [RadioFit.wrap] is Fitted RadioButton Widget.
  /// resize your children widgets size.
  final RadioFit fit;

  /// this Property use only in RadioGroup do self.
  ///
  /// [radioGroupProvider] you don't worried this.
  /// I talled one more This property use only in RadioGroup do self.
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
    return widget.fit == RadioFit.wrap
        ? FittedBox(child: radioButtonBase())
        : radioButtonBase();
  }

  /// it this RadioButton do not used in RadioGroup
  /// Flex Widget will make hasSize Error
  Widget _horizontalRadioButton() {
    debugPrint("_horizontalRadioButton..");
    return widget.fit == RadioFit.wrap
        ? FittedBox(child: Expanded(child: radioButtonBase()))
        : Expanded(child: radioButtonBase());
  }

  Widget radioButtonBase() {
    return InkWell(
      onTap: widget.entireTouchable ? () {
        radioGroupProvider?.change(widget.value);
      } : null,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: widget.decoration,
        child: Row(
          mainAxisAlignment: widget.align,
          children: [
            IconButton(
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
            widget.content ?? const SizedBox(),
          ]
        ),
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
