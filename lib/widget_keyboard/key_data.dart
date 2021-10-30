import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class KeyData {
  KeyType type;
  String normalText;
  String? alternativeText;
  IconData? normalIcon;
  IconData? alternativeIcon;

  KeyData(
      {this.normalIcon,
      this.alternativeIcon,
      required this.type,
      required this.normalText,
      this.alternativeText});
}
