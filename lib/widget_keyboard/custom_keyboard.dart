import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/key_controller.dart';

class CustomKeyboard extends StatefulWidget {
  final List<List<CustomKey>> rowKeys;
  final KeyController? keyController;

  const CustomKeyboard({this.keyController, required this.rowKeys, Key? key})
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
        debugPrint("switch 1");
        return Colors.blue;
      } else {
        debugPrint("switch 2");
        return Colors.grey[850];
      }
    }
    debugPrint("switch 3");
    return Colors.grey[850];
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
