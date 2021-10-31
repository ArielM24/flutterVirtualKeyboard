import 'package:keyboard/widget_keyboard/custom_key.dart';
import 'package:keyboard/widget_keyboard/key_data.dart';
import 'package:keyboard/widget_keyboard/key_types.dart';

class GenericKeys {
  static List<KeyData> numericKeys = [
    KeyData(type: KeyType.textKey, normalText: "0", alternativeText: "zero"),
    KeyData(type: KeyType.textKey, normalText: "1", alternativeText: "one"),
    KeyData(type: KeyType.textKey, normalText: "2", alternativeText: "two"),
    KeyData(type: KeyType.textKey, normalText: "3", alternativeText: "three"),
    KeyData(type: KeyType.textKey, normalText: "4"),
    KeyData(type: KeyType.textKey, normalText: "5"),
    KeyData(type: KeyType.textKey, normalText: "6"),
    KeyData(type: KeyType.textKey, normalText: "7"),
    KeyData(type: KeyType.textKey, normalText: "8"),
    KeyData(type: KeyType.textKey, normalText: "9"),
  ];

  static List<String> qwertyKeys = ["q", "w", "c"];
}
