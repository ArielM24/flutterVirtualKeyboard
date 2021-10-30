import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/custom_keyboard.dart';

class CustomInputKeyboard extends StatefulWidget {
  final TextEditingController controller;
  final CustomKeyboard keyboard;
  final Function(BuildContext)? onSubmit;
  final Future<bool> Function(String)? validator;
  final String labelText;
  final String errorText;

  const CustomInputKeyboard(
      {required this.keyboard,
      required this.controller,
      this.labelText = "",
      this.errorText = "Invalid Format",
      this.onSubmit,
      this.validator,
      Key? key})
      : super(key: key);

  @override
  _CustomInputKeyboardState createState() => _CustomInputKeyboardState();
}

class _CustomInputKeyboardState extends State<CustomInputKeyboard> {
  bool _validated = true;

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
                  readOnly: true,
                  showCursor: true,
                  controller: widget.controller,
                  decoration: InputDecoration(
                      labelText: widget.labelText,
                      errorText: _validated ? null : widget.errorText),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    child: const Text("Submit"),
                    onPressed: submitCallback,
                  ))
            ],
          ),
          Expanded(
            flex: 4,
            child: widget.keyboard,
          )
        ],
      ),
    );
  }

  submitCallback() async {
    if (widget.validator != null) {
      _validated = await widget.validator!(widget.controller.text);
    } else {
      _validated = true;
    }
    setState(() {});
    if (_validated) {
      if (widget.onSubmit != null) {
        await widget.onSubmit!(context);
      } else {
        Navigator.of(context).pop(widget.controller.text);
      }
    }
  }
}
