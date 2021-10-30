import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<String> onTextCallback;
  final ValueSetter<String>? onLongTextCallback;
  final Function? onLongSpecialCallback;
  final Function? onSpecialCallback;

  const CustomKeyboard(
      {required this.onTextCallback,
      this.onLongTextCallback,
      this.onSpecialCallback,
      this.onLongSpecialCallback,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Column(
        children: [firstRow(), secondRow(), thirdRow(), fourthRow()],
      ),
    );
  }

  Expanded firstRow() {
    return Expanded(
      child: Row(
        children: [
          CustomKey(
              text: "1",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "2",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "3",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
        ],
      ),
    );
  }

  Expanded secondRow() {
    return Expanded(
      child: Row(
        children: [
          CustomKey(
              text: "4",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "5",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "6",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
        ],
      ),
    );
  }

  Expanded thirdRow() {
    return Expanded(
      child: Row(
        children: [
          CustomKey(
              text: "7",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "8",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "9",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
        ],
      ),
    );
  }

  Expanded fourthRow() {
    return Expanded(
      child: Row(
        children: [
          CustomKey(
              text: "0",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: ".",
              onTextCallback: onTextCallback,
              onLongTextCallback: onLongTextCallback,
              type: KeyType.textKey),
          CustomKey(
              text: "<-",
              onTextCallback: onTextCallback,
              onSpecialCallback: onSpecialCallback,
              onLongSpecialCallback: onLongSpecialCallback,
              icon: Icons.backspace_outlined,
              type: KeyType.specialKey),
        ],
      ),
    );
  }
}
