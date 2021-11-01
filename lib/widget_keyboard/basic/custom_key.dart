import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/keyboard_controller.dart';
import 'package:keyboard/widget_keyboard/basic/key_data.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

class CustomKey extends StatefulWidget {
  final Function(String) onDataInput;
  final Function(String)? onLongDataInput;
  final int flex;
  final Function? onSpecialCallback;
  final KeyData keyData;
  final KeyboardController? keyboardController;
  final BorderRadius? radius;
  final EdgeInsets padding;
  final Color? keyColor;
  final Color? altKeyColor;
  final Color? shiftKeyColor;

  const CustomKey(
      {required this.keyData,
      required this.onDataInput,
      this.keyColor,
      this.altKeyColor,
      this.shiftKeyColor,
      this.onLongDataInput,
      this.keyboardController,
      this.flex = 1,
      this.onSpecialCallback,
      this.radius,
      this.padding = const EdgeInsets.all(3.0),
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
        padding: widget.padding,
        child: Container(
          decoration: BoxDecoration(
            color: getKeyColor(),
            borderRadius: widget.radius ?? BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (widget.keyData.shiftedText != null)
                Positioned(
                  child: Text(
                    currentShifted(),
                  ),
                  right: 5,
                  top: 5,
                ),
              if (widget.keyData.alternativeText != null)
                Positioned(
                  child: Text(
                    currentAlternative(),
                  ),
                  right: 5,
                  bottom: 5,
                ),
              Listener(
                behavior: HitTestBehavior.opaque,
                onPointerDown: (PointerDownEvent event) async =>
                    await onKeepPressed(event),
                onPointerUp: (PointerUpEvent event) {
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
                      child: labelWidget(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String currentAlternative() {
    if (widget.keyboardController != null) {
      if (widget.keyboardController!.isAlternativeActive) {
        if (widget.keyboardController!.isShiftActive) {
          if (widget.keyData.shiftedText != null) {
            return widget.keyData.shiftedText!;
          }
        }
        return widget.keyData.normalText;
      } else {
        if (widget.keyData.alternativeText != null) {
          return widget.keyData.alternativeText!;
        }
      }
    }
    return "";
  }

  String currentShifted() {
    if (widget.keyboardController!.isShiftActive) {
      return (widget.keyData.normalText);
    } else {
      if (widget.keyData.shiftedText != null) {
        return (widget.keyData.shiftedText!);
      } else {
        return "";
      }
    }
  }

  String currenText() {
    if (widget.keyboardController != null) {
      if (widget.keyboardController!.isAlternativeActive) {
        if (widget.keyData.alternativeText != null) {
          return widget.keyData.alternativeText!;
        }
      }
      if (widget.keyboardController!.isShiftActive) {
        if (widget.keyData.shiftedText != null) {
          return (widget.keyData.shiftedText!);
        } else {
          return (widget.keyData.normalText);
        }
      } else {
        return (widget.keyData.normalText);
      }
    } else {
      return (widget.keyData.normalText);
    }
  }

  IconData? currentIcon() {
    if (widget.keyboardController != null) {
      if (widget.keyboardController!.isShiftActive) {
        return widget.keyData.shiftedIcon ?? widget.keyData.normalIcon;
      } else {
        return widget.keyData.normalIcon;
      }
    }
    return widget.keyData.normalIcon;
  }

  Widget labelWidget() {
    IconData? iconData = currentIcon();
    if (iconData != null) {
      return Icon(iconData);
    } else {
      return Text(
        currenText(),
        style: const TextStyle(fontSize: 23),
      );
    }
  }

  onKeepPressed(PointerDownEvent event) async {
    isPointerDown = true;
    if (widget.keyData.type == KeyType.textKey) {
      while (isPointerDown) {
        await widget.onDataInput(currenText());
        await Future.delayed(const Duration(milliseconds: 150));
      }
    } else {
      if (widget.onSpecialCallback != null) {
        while (isPointerDown) {
          await widget.onSpecialCallback!();
          if (!widget.keyData.keepPressed) {
            break;
          }
          await Future.delayed(const Duration(milliseconds: 50));
        }
      }
    }
  }

  Color? getKeyColor() {
    Map<KeyType, Color?> keyColor = {
      KeyType.altKey: widget.altKeyColor ?? Colors.grey[350],
      KeyType.shiftKey: widget.shiftKeyColor ?? Colors.grey[350],
      KeyType.specialKey: widget.keyColor ?? Colors.grey,
      KeyType.textKey: widget.altKeyColor ?? Colors.grey,
    };
    if (widget.keyboardController != null) {
      if (widget.keyboardController!.isAlternativeActive) {
        debugPrint("${widget.keyData.type}");
        if (widget.keyData.type == KeyType.altKey) {
          debugPrint("alt");
          return keyColor[KeyType.altKey];
        }
      }
      if (widget.keyboardController!.isShiftActive) {
        if (widget.keyData.type == KeyType.shiftKey) {
          debugPrint("sft");
          return keyColor[KeyType.shiftKey];
        }
      }
    }
    return keyColor[KeyType.textKey];
  }
}
