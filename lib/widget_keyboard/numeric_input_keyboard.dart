import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_input_keyboard.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/custom_keyboard.dart';
import 'package:keyboard/widget_keyboard/generic_keys.dart';
import 'package:keyboard/widget_keyboard/key_data.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class NumericInputKeyboard extends StatefulWidget {
  final bool floatingPoint;
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final Function(BuildContext)? onSubmit;
  final Future<bool> Function(String)? validator;

  const NumericInputKeyboard(
      {required this.controller,
      this.onSubmit,
      this.validator,
      this.labelText = "",
      this.errorText = "Invalid format",
      this.floatingPoint = true,
      Key? key})
      : super(key: key);

  @override
  State<NumericInputKeyboard> createState() => _NumericInputKeyboardState();
}

class _NumericInputKeyboardState extends State<NumericInputKeyboard> {
  @override
  Widget build(BuildContext context) {
    return CustomInputKeyboard(
        validator: widget.validator,
        onSubmit: widget.onSubmit,
        labelText: widget.labelText,
        errorText: widget.errorText,
        keyboard: CustomKeyboard(
          rowKeys: [..._numericRows(), _bottomRow()],
          onDataInput: onNumberInput,
        ),
        controller: widget.controller);
  }

  Future<bool> validator(String text) async {
    return text.length > 3;
  }

  List<List<CustomKey>> _numericRows() {
    List<List<CustomKey>> keys = [];
    int currentKey = 1;
    for (int i = 0; i < 3; i++) {
      List<CustomKey> row = [];
      for (int j = 0; j < 3; j++) {
        row.add(CustomKey(
          keyData: GenericKeys.numericKeys[currentKey],
          onDataInput: onNumberInput,
        ));
        currentKey++;
      }
      keys.add(row);
    }
    return keys;
  }

  List<CustomKey> _bottomRow() {
    return <CustomKey>[
      CustomKey(
          keyData: GenericKeys.numericKeys[0], onDataInput: onNumberInput),
      if (widget.floatingPoint)
        CustomKey(
            keyData: KeyData(type: KeyType.specialKey, normalText: "."),
            onSpecialCallback: onFloatingPointInput,
            onDataInput: (_) async {}),
      CustomKey(
          keyData: KeyData(type: KeyType.specialKey, normalText: ""),
          icon: Icons.backspace_outlined,
          onSpecialCallback: onDeleteCallback,
          onDataInput: (_) async {}),
    ];
  }

  onNumberInput(String keyText) {
    final text = widget.controller.text;
    final newText = text + keyText;
    widget.controller.text = newText;
  }

  onDeleteCallback() {
    final text = widget.controller.text;
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      widget.controller.text = newText;
    }
  }

  onFloatingPointInput() {
    final text = widget.controller.text;
    if (!text.contains(".")) {
      final newText = text + ".";
      widget.controller.text = newText;
    }
  }
}
