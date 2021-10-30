import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/custom_keyboard.dart';
import 'package:keyboard/widget_keyboard/generic_keys.dart';
import 'package:keyboard/widget_keyboard/key_data.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class NumericInputKeyboard extends StatefulWidget {
  final bool floatingPoint;
  final TextEditingController controller;
  const NumericInputKeyboard(
      {required this.controller, this.floatingPoint = true, Key? key})
      : super(key: key);

  @override
  State<NumericInputKeyboard> createState() => _NumericInputKeyboardState();
}

class _NumericInputKeyboardState extends State<NumericInputKeyboard> {
  bool _validate = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 7,
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _validate ? null : "Format invalid"),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    child: const Text("Accept"),
                    onPressed: () async => await onAcceptCallback(context),
                  ))
            ],
          ),
          Expanded(
            flex: 4,
            child: CustomKeyboard(
              rowKeys: [..._numericRows(), _bottomRow()],
              onDataInput: onNumberInput,
            ),
          )
        ],
      ),
    );
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

  validate(String text) {
    _validate = text.isNotEmpty;
    setState(() {});
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

  onAcceptCallback(BuildContext context) {
    validate(widget.controller.text);
    if (_validate) {
      Navigator.of(context).pop(widget.controller.text);
    }
  }
}
