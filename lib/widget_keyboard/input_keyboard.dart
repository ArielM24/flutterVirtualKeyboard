import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_keyboard.dart';

class InputKeyboard extends StatelessWidget {
  late final TextEditingController controller;
  // ignore: prefer_const_constructors_in_immutables
  InputKeyboard({Key? key}) : super(key: key);
  static String lastAcceptedText = "";

  @override
  Widget build(BuildContext context) {
    controller = TextEditingController();
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
                  controller: controller,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    child: const Text("Accept"),
                    onPressed: () => onAcceptCallback(context),
                  ))
            ],
          ),
          Expanded(
            flex: 4,
            child: CustomKeyboard(
              onTextCallback: onTextCallback,
              onSpecialCallback: onDeleteCallback,
            ),
          )
        ],
      ),
    );
  }

  void onTextCallback(String keyText) {
    final text = controller.text;
    final newText = text + keyText;
    controller.text = newText;
  }

  void onDeleteCallback() {
    final text = controller.text;
    debugPrint(text);
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      controller.text = newText;
    }
  }

  void onAcceptCallback(BuildContext context) {
    lastAcceptedText = controller.text;
    Navigator.of(context).pop();
  }
}
