import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

class KeyData {
  KeyType type;
  String normalText;
  String? shiftedText;
  String? alternativeText;
  IconData? normalIcon;
  IconData? shiftedIcon;
  bool keepPressed;
  Color? keyColor;
  Color? altKeyColor;
  Color? shiftKeyColor;
  Color? textColor;
  Color? altTextColor;
  Color? shiftTextColor;

  KeyData(
      {this.normalIcon,
      textColor,
      keyColor,
      altKeyColor,
      shiftKeyColor,
      this.keepPressed = true,
      this.shiftedIcon,
      this.alternativeText,
      altTextColor,
      shiftTextColor,
      required this.type,
      required this.normalText,
      this.shiftedText}) {
    this.keyColor = keyColor ?? Colors.grey;
    this.textColor = textColor ?? Colors.black;
    this.altTextColor = altTextColor ?? Colors.black;
    this.altKeyColor = altKeyColor ?? Colors.grey;
    this.shiftKeyColor = shiftKeyColor ?? Colors.grey;
    this.shiftTextColor = shiftTextColor ?? Colors.black;
  }
}
