import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/custom_input_keyboard.dart';
import 'package:keyboard/widget_keyboard/basic/custom_key.dart';
import 'package:keyboard/widget_keyboard/basic/custom_keyboard.dart';
import 'package:keyboard/widget_keyboard/basic/generic_keys.dart';
import 'package:keyboard/widget_keyboard/basic/key_controller.dart';
import 'package:keyboard/widget_keyboard/basic/key_data.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

class QwertInputKeyboard extends StatefulWidget {
  final TextEditingController textController;
  final String labelText;
  final String errorText;
  final Function(BuildContext)? onSubmit;
  final Future<bool> Function(String)? validator;
  const QwertInputKeyboard(
      {Key? key,
      required this.textController,
      this.labelText = "",
      this.errorText = "Invalid format",
      this.onSubmit,
      this.validator})
      : super(key: key);

  @override
  _QwertInputKeyboardState createState() => _QwertInputKeyboardState();
}

class _QwertInputKeyboardState extends State<QwertInputKeyboard> {
  KeyboardController? keyboardController;

  @override
  void initState() {
    super.initState();
    keyboardController = KeyboardController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInputKeyboard(
      textController: widget.textController,
      onSubmit: widget.onSubmit,
      errorText: widget.errorText,
      labelText: widget.labelText,
      validator: widget.validator,
      keyboard: CustomKeyboard(
        rowKeys: [...qwertykeys(), bottomRow()],
        keyboardController: keyboardController,
      ),
    );
  }

  List<List<CustomKey>> qwertykeys() {
    List<List<CustomKey>> rows = [];
    for (int i = 0; i < GenericKeys.qwertyKeys.length; i++) {
      List<CustomKey> row = [];
      for (int j = 0; j < GenericKeys.qwertyKeys[i].length; j++) {
        row.add(CustomKey(
          keyData: GenericKeys.qwertyKeys[i][j],
          onDataInput: onTextInput,
          keyboardController: keyboardController,
        ));
      }
      rows.add(row);
    }
    return rows;
  }

  List<CustomKey> bottomRow() {
    return <CustomKey>[
      CustomKey(
          keyboardController: keyboardController,
          onSpecialCallback: onShiftInput,
          keyData: KeyData(
              keepPressed: false,
              type: KeyType.specialKey,
              normalText: "",
              normalIcon: Icons.file_upload_rounded,
              alternativeIcon: Icons.file_upload_outlined),
          onDataInput: (_) async {}),
      CustomKey(
          keyData: KeyData(
              type: KeyType.textKey,
              normalText: " ",
              normalIcon: Icons.space_bar),
          onDataInput: onTextInput),
      CustomKey(
        keyData: KeyData(
            type: KeyType.specialKey,
            normalText: "",
            normalIcon: Icons.backspace_outlined),
        onDataInput: (_) async {},
        onSpecialCallback: onDeleteCallback,
      )
    ];
  }

  onTextInput(String keyText) {
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

  onShiftInput() {
    keyboardController?.alternateKeys();
    setState(() {});
  }
}
