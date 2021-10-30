import 'package:keyboard/widget_keyboard/key_types.dart';

class KeyData {
  KeyType type;
  String normalText;
  String? alternativeText;

  KeyData({required this.type, required this.normalText, this.alternativeText});
}
