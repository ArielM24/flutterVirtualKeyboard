import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/key_controller.dart';

class CustomKeyboard extends StatefulWidget {
  final List<List<CustomKey>> rowKeys;
  final List<List<CustomKey>>? shiftedRowKeys;
  final KeyController? keyController;
  final Color? color;
  final Color? switchedColor;

  const CustomKeyboard(
      {this.shiftedRowKeys,
      this.keyController,
      this.color,
      this.switchedColor,
      required this.rowKeys,
      Key? key})
      : super(key: key);

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColor(),
      child: Column(
        children: _rowsBuilder(),
      ),
    );
  }

  Color? getColor() {
    if (widget.keyController != null) {
      if (widget.keyController!.isSwitched) {
        if (widget.switchedColor != null) {
          return widget.switchedColor;
        } else if (widget.color != null) {
          return widget.color;
        } else {
          return Colors.grey[850];
        }
      } else {
        if (widget.color != null) {
          return widget.color;
        } else {
          return Colors.grey[850];
        }
      }
    }
  }

  List<List<CustomKey>> currentKeys() {
    if (widget.keyController != null) {
      if (widget.keyController!.isSwitched) {
        return widget.shiftedRowKeys ?? widget.rowKeys;
      } else {
        return widget.rowKeys;
      }
    }
    return widget.rowKeys;
  }

  List<Widget> _rowsBuilder() {
    List<Widget> rows = [];
    List<List<CustomKey>> keys = currentKeys();
    for (int i = 0; i < keys.length; i++) {
      rows.add(Expanded(
        child: Row(children: keys[i]),
      ));
    }
    return rows;
  }
}
