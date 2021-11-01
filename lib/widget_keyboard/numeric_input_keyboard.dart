import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/custom_input_keyboard.dart';
import 'package:keyboard/widget_keyboard/basic/custom_key.dart';
import 'package:keyboard/widget_keyboard/basic/custom_keyboard.dart';
import 'package:keyboard/widget_keyboard/basic/generic_keys.dart';
import 'package:keyboard/widget_keyboard/basic/keyboard_controller.dart';
import 'package:keyboard/widget_keyboard/basic/key_data.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

class NumericInputKeyboard extends StatefulWidget {
  final bool floatingPoint;
  final TextEditingController textController;
  final String labelText;
  final String errorText;
  final Function(BuildContext)? onSubmit;
  final Future<bool> Function(String)? validator;

  const NumericInputKeyboard(
      {required this.textController,
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
  KeyboardController? keyboardController;

  @override
  void initState() {
    super.initState();
    keyboardController = KeyboardController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputKeyboard(
        validator: widget.validator,
        onSubmit: widget.onSubmit,
        labelText: widget.labelText,
        errorText: widget.errorText,
        keyboard: CustomKeyboard(
          keyboardController: keyboardController,
          rowKeys: [..._numericRows(), _deleteRow()],
        ),
        textController: widget.textController);
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
          keyboardController: keyboardController,
          keyData: GenericKeys.numericKeys[currentKey],
          onDataInput: onNumberInput,
        ));
        currentKey++;
      }
      keys.add(row);
    }
    return keys;
  }

  List<CustomKey> _deleteRow() {
    return <CustomKey>[
      CustomKey(
          keyboardController: keyboardController,
          keyData: GenericKeys.numericKeys[0],
          onDataInput: onNumberInput),
      if (widget.floatingPoint)
        CustomKey(
            keyboardController: keyboardController,
            keyData: KeyData(type: KeyType.specialKey, normalText: "."),
            onSpecialCallback: onFloatingPointInput,
            onDataInput: (_) async {}),
      CustomKey(
          keyboardController: keyboardController,
          keyData: KeyData(
            type: KeyType.specialKey,
            normalText: "",
            normalIcon: Icons.backspace_outlined,
          ),
          onSpecialCallback: onDeleteCallback,
          onDataInput: (_) async {}),
    ];
  }

  onNumberInput(String keyText) {
    final text = widget.textController.text;
    final newText = text + keyText;
    widget.textController.text = newText;
  }

  onDeleteCallback() {
    final text = widget.textController.text;
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      widget.textController.text = newText;
    }
  }

  onFloatingPointInput() {
    final text = widget.textController.text;
    if (!text.contains(".")) {
      final newText = text + ".";
      widget.textController.text = newText;
    }
  }
}
