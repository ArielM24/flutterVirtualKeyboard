import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/key_data.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class CustomKey extends StatefulWidget {
  final Function(String) onDataInput;
  final Function(String)? onLongDataInput;
  final int flex;
  final IconData? icon;
  final Function? onSpecialCallback;
  final KeyData keyData;

  const CustomKey(
      {required this.keyData,
      required this.onDataInput,
      this.onLongDataInput,
      this.flex = 1,
      this.icon,
      this.onSpecialCallback,
      Key? key})
      : super(key: key);

  @override
  State<CustomKey> createState() => _CustomKeyState();
}

class _CustomKeyState extends State<CustomKey> {
  bool isPointerDown = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerDown: (PointerDownEvent event) async =>
                await onKeepPressed(event),
            onPointerUp: (PointerUpEvent event) {
              debugPrint("pointer");
              isPointerDown = false;
            },
            child: InkWell(
                onTap: () {},
                onLongPress: () {
                  if (widget.onLongDataInput != null) {
                    widget.onLongDataInput!(widget.keyData.normalText);
                  }
                },
                child: Center(
                  child: (widget.icon != null)
                      ? Icon(widget.icon)
                      : Text(widget.keyData.normalText),
                )),
          ),
        ),
      ),
    );
  }

  onKeepPressed(PointerDownEvent event) async {
    debugPrint("pointer down");
    isPointerDown = true;
    if (widget.keyData.type == KeyType.textKey) {
      while (isPointerDown) {
        await widget.onDataInput(widget.keyData.normalText);
        await Future.delayed(const Duration(milliseconds: 150));
      }
    } else if (widget.keyData.type == KeyType.specialKey) {
      debugPrint("special");
      if (widget.onSpecialCallback != null) {
        debugPrint("not null");
        while (isPointerDown) {
          await widget.onSpecialCallback!();
          await Future.delayed(const Duration(milliseconds: 50));
        }
      }
    }
  }
}
