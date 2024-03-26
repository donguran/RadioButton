import 'package:flutter/material.dart';
import 'package:radio_button/radio/radio_button_widget.dart';
import 'package:radio_button/radio/radio_orientation.dart';

class RadioGroup<T> extends StatefulWidget {
  RadioGroup({
    super.key,
    required this.groupId,
    required this.children,
    this.onChanged,
    this.orientation = RadioOrientation.horizontal,
    this.checkedValue
  }) {
    debugPrint("RadioGroup 생성");
  }

  final T groupId;

  /// [checkedValue] is checked RadioButton created RadioGroup.
  T? checkedValue;

  /// certainly, do this [children] widgets recommend all same type.
  /// if you don't my order.
  /// you will be show Error hasSize.
  ///
  /// so please register same type.
  final List<Widget> children;
  Function(dynamic value)? onChanged;

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint("[RadioGroup.. didChangeDependencies..");
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
    debugPrint("[RadioGroup].. didUpdateWidget..");
    for (var item in widget.children) {
      if (item is RadioButton) {
        item.groupId = widget.groupId;
        item.radioGroupProvider = radioGroupProvider;
        item.radioGroupProvider!.orientation = widget.orientation;

        /*if (widget.checkedValue != null) {
          item.radioGroupProvider!.changeNotNotify(widget.checkedValue);
        }*/
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("[RadioGroup].. build.. orientation:${widget.orientation}");

    return Flexible(
      child: widget.orientation == RadioOrientation.horizontal
          ? Row(children: widget.children,)
          : Column(children: widget.children,),
    );
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
    radioGroupId = value;

    if (onChanged != null) {
      onChanged!(value);
    }
  }

  void change(T value) {
    changeNotNotify(value);

    notifyListeners();
  }

  bool isEqual(T value) => radioGroupId == value;
}
