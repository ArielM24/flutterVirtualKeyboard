import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class CustomKey extends StatefulWidget {
  final KeyType type;
  final String text;
  final ValueSetter<String> onTextCallback;
  final ValueSetter<String>? onLongTextCallback;
  final int flex;
  final IconData? icon;
  final Function? onSpecialCallback;
  final Function? onLongSpecialCallback;

  const CustomKey(
      {required this.text,
      required this.onTextCallback,
      required this.type,
      this.flex = 1,
      this.icon,
      this.onLongTextCallback,
      this.onSpecialCallback,
      this.onLongSpecialCallback,
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
            onPointerDown: (PointerDownEvent event) async {
              debugPrint("pointer down");
              isPointerDown = true;
              if (widget.type == KeyType.textKey) {
                while (isPointerDown) {
                  widget.onTextCallback.call(widget.text);
                  await Future.delayed(const Duration(milliseconds: 150));
                }
              } else if (widget.type == KeyType.specialKey) {
                debugPrint("special");
                if (widget.onSpecialCallback != null) {
                  debugPrint("not null");
                  while (isPointerDown) {
                    widget.onSpecialCallback!();
                    await Future.delayed(const Duration(milliseconds: 50));
                  }
                }
              }
            },
            onPointerUp: (PointerUpEvent event) {
              debugPrint("pointer");
              isPointerDown = false;
            },
            child: InkWell(
                onTap: () {},
                child: Center(
                  child: (widget.type == KeyType.specialKey)
                      ? Icon(widget.icon ?? Icons.auto_fix_off_outlined)
                      : Text(widget.text),
                )),
          ),
        ),
      ),
    );
  }
}
