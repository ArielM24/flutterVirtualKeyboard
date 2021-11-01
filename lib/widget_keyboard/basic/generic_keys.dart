import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/custom_key.dart';
import 'package:keyboard/widget_keyboard/basic/key_data.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

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

  static List<List<KeyData>> qwertyKeys = [
    [
      KeyData(type: KeyType.textKey, normalText: "1", alternativeText: "!"),
      KeyData(type: KeyType.textKey, normalText: "2", alternativeText: "\""),
      KeyData(type: KeyType.textKey, normalText: "3", alternativeText: "#"),
      KeyData(type: KeyType.textKey, normalText: "4", alternativeText: "\$"),
      KeyData(type: KeyType.textKey, normalText: "5", alternativeText: "%"),
      KeyData(type: KeyType.textKey, normalText: "6", alternativeText: "&"),
      KeyData(type: KeyType.textKey, normalText: "7", alternativeText: "/"),
      KeyData(type: KeyType.textKey, normalText: "8", alternativeText: "("),
      KeyData(type: KeyType.textKey, normalText: "9", alternativeText: ")"),
      KeyData(type: KeyType.textKey, normalText: "0", alternativeText: "="),
      KeyData(type: KeyType.textKey, normalText: "'", alternativeText: "?"),
      KeyData(type: KeyType.textKey, normalText: "¿", alternativeText: "¡"),
    ],
    [
      KeyData(type: KeyType.textKey, normalText: "q", alternativeText: "Q"),
      KeyData(type: KeyType.textKey, normalText: "w", alternativeText: "W"),
      KeyData(type: KeyType.textKey, normalText: "e", alternativeText: "E"),
      KeyData(type: KeyType.textKey, normalText: "r", alternativeText: "R"),
      KeyData(type: KeyType.textKey, normalText: "t", alternativeText: "T"),
      KeyData(type: KeyType.textKey, normalText: "y", alternativeText: "Y"),
      KeyData(type: KeyType.textKey, normalText: "u", alternativeText: "U"),
      KeyData(type: KeyType.textKey, normalText: "i", alternativeText: "I"),
      KeyData(type: KeyType.textKey, normalText: "o", alternativeText: "O"),
      KeyData(type: KeyType.textKey, normalText: "p", alternativeText: "P"),
    ],
    [
      KeyData(type: KeyType.textKey, normalText: "a", alternativeText: "A"),
      KeyData(type: KeyType.textKey, normalText: "s", alternativeText: "S"),
      KeyData(type: KeyType.textKey, normalText: "d", alternativeText: "D"),
      KeyData(type: KeyType.textKey, normalText: "f", alternativeText: "F"),
      KeyData(type: KeyType.textKey, normalText: "g", alternativeText: "G"),
      KeyData(type: KeyType.textKey, normalText: "h", alternativeText: "H"),
      KeyData(type: KeyType.textKey, normalText: "j", alternativeText: "J"),
      KeyData(type: KeyType.textKey, normalText: "k", alternativeText: "K"),
      KeyData(type: KeyType.textKey, normalText: "l", alternativeText: "L"),
      KeyData(type: KeyType.textKey, normalText: "ñ", alternativeText: "Ñ"),
    ],
    [
      KeyData(type: KeyType.textKey, normalText: "z", alternativeText: "Z"),
      KeyData(type: KeyType.textKey, normalText: "x", alternativeText: "X"),
      KeyData(type: KeyType.textKey, normalText: "c", alternativeText: "C"),
      KeyData(type: KeyType.textKey, normalText: "v", alternativeText: "V"),
      KeyData(type: KeyType.textKey, normalText: "b", alternativeText: "B"),
      KeyData(type: KeyType.textKey, normalText: "n", alternativeText: "N"),
      KeyData(type: KeyType.textKey, normalText: "m", alternativeText: "M"),
      KeyData(type: KeyType.textKey, normalText: ",", alternativeText: ";"),
      KeyData(type: KeyType.textKey, normalText: "."),
      KeyData(type: KeyType.textKey, normalText: "-", alternativeText: "_"),
    ],
  ];
}
