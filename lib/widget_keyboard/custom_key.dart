import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/key_controller.dart';
import 'package:keyboard/widget_keyboard/key_data.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class CustomKey extends StatefulWidget {
  final Function(String) onDataInput;
  final Function(String)? onLongDataInput;
  final int flex;
  final Function? onSpecialCallback;
  final KeyData keyData;
  final KeyController? keyController;

  const CustomKey(
      {required this.keyData,
      required this.onDataInput,
      this.onLongDataInput,
      this.keyController,
      this.flex = 1,
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
                  child: labelWidget(),
                )),
          ),
        ),
      ),
    );
  }

  String currenText() {
    if (widget.keyController != null) {
      if (widget.keyController!.isAlternativeActive) {
        if (widget.keyData.alternativeText != null) {
          debugPrint("case 4");
          return (widget.keyData.alternativeText!);
        } else {
          debugPrint("case 5");
          return (widget.keyData.normalText);
        }
      } else {
        debugPrint("case 6");
        return (widget.keyData.normalText);
      }
    } else {
      debugPrint("case 7");
      return (widget.keyData.normalText);
    }
  }

  IconData? currentIcon() {
    if (widget.keyController != null) {
      if (widget.keyController!.isAlternativeActive) {
        return widget.keyData.alternativeIcon ?? widget.keyData.normalIcon;
      } else {
        return widget.keyData.normalIcon;
      }
    }
    return widget.keyData.normalIcon;
  }

  Widget labelWidget() {
    IconData? iconData = currentIcon();
    if (iconData != null) {
      debugPrint("case 1");
      return Icon(iconData);
    } else {
      return Text(currenText());
    }
  }

  onKeepPressed(PointerDownEvent event) async {
    debugPrint("pointer down");
    isPointerDown = true;
    if (widget.keyData.type == KeyType.textKey) {
      while (isPointerDown) {
        await widget.onDataInput(currenText());
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
