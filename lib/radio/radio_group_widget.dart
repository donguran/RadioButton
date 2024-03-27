import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_button_widget.dart';
import 'package:radio_button/radio/radio_orientation.dart';

class RadioGroup<T> extends StatefulWidget {
  const RadioGroup({
    super.key,
    required this.groupId,
    required this.children,
    this.onChanged,
    this.orientation = RadioOrientation.horizontal,
    this.checkedValue
  });

  /// [groupId] radio action result
  final T groupId;

  /// [checkedValue] is checked RadioButton created RadioGroup.
  final T? checkedValue;

  /// certainly, do this [children] widgets recommend all same type.
  /// if you don't my order.
  /// you will be show Error hasSize.
  ///
  /// so please register same type.
  final List<Widget> children;

  /// [onChanged] manages all about included RadioButton.
  /// parameter [value] is changed [groupId]
  ///
  /// but more kinds of functions.
  /// If you want change value into otherValue.
  ///
  /// like this,
  /// [onChanged] : (value) {
  ///   setState(() {
  ///     [otherValue] = [value];
  ///   })
  final Function(dynamic value)? onChanged;

  /// default [orientation] : [RadioOrientation.horizontal]
  final RadioOrientation orientation;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  late RadioGroupProvider radioGroupProvider;

  @override
  void initState() {
    super.initState();
    debugPrint("[RadioGroup].. initState..");

    radioGroupProvider = RadioGroupProvider._(
      radioGroupId: widget.groupId,
      onChanged: widget.onChanged
    );

    for (var item in widget.children) {
      if (item is RadioButton) {
        item.radioGroupProvider = radioGroupProvider;
        item.radioGroupProvider!.orientation = widget.orientation;

        if (widget.checkedValue != null) {
          item.radioGroupProvider!.changeNotNotify(widget.checkedValue);
        }
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // debugPrint("[RadioGroup.. didChangeDependencies..");
  }

  /// I tried otherwise,
  /// but this override method is better than others.
  /// StatefulWidget called twice setState.
  ///
  /// if RadioButton setting two build,
  /// there not have [widget.groupId], [radioGroupId]
  @override
  void didUpdateWidget(covariant RadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    // debugPrint("[RadioGroup].. didUpdateWidget..");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioGroup].. build.. orientation:${widget.orientation}");

    return widget.orientation == RadioOrientation.horizontal
        ? Row(children: widget.children,)
        : Column(children: widget.children,);
  }
}

class RadioGroupProvider<T> extends ChangeNotifier {
  RadioGroupProvider._({
    required this.radioGroupId,
    this.onChanged
  });

  T radioGroupId;
  Function(dynamic value)? onChanged;
  RadioOrientation orientation = RadioOrientation.vertical;

  void changeNotNotify(T value) {
    if (radioGroupId.runtimeType == value.runtimeType) {
      radioGroupId = value;
    }
  }

  void change(T value) {
    if (radioGroupId.runtimeType == value.runtimeType) {
      radioGroupId = value;

      if (onChanged != null) {
        onChanged!(value);
      }

      notifyListeners();
    }
  }

  bool isEqual(T value) => radioGroupId == value;
}
