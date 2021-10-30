import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';

class CustomKeyboard extends StatefulWidget {
  final ValueSetter<String> onDataInput;

  final List<List<CustomKey>> rowKeys;

  const CustomKeyboard(
      {required this.onDataInput, required this.rowKeys, Key? key})
      : super(key: key);

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Column(
        children: _rowsBuilder(),
      ),
    );
  }

  List<Widget> _rowsBuilder() {
    List<Widget> rows = [];
    for (int i = 0; i < widget.rowKeys.length; i++) {
      rows.add(Expanded(
        child: Row(children: widget.rowKeys[i]),
      ));
    }
    return rows;
  }
}
