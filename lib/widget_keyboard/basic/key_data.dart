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

  KeyData(
      {this.normalIcon,
      this.keepPressed = true,
      this.shiftedIcon,
      this.alternativeText,
      required this.type,
      required this.normalText,
      this.shiftedText});
}
