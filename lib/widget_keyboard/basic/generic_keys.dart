import 'package:flutter/material.dart';
import 'package:keyboard/widget_keyboard/basic/key_data.dart';
import 'package:keyboard/widget_keyboard/basic/key_types.dart';

class GenericKeys {
  static List<KeyData> numericKeys = [
    KeyData(type: KeyType.textKey, normalText: "0"),
    KeyData(type: KeyType.textKey, normalText: "1"),
    KeyData(type: KeyType.textKey, normalText: "2"),
    KeyData(type: KeyType.textKey, normalText: "3"),
    KeyData(type: KeyType.textKey, normalText: "4"),
    KeyData(type: KeyType.textKey, normalText: "5"),
    KeyData(type: KeyType.textKey, normalText: "6"),
    KeyData(type: KeyType.textKey, normalText: "7"),
    KeyData(type: KeyType.textKey, normalText: "8"),
    KeyData(type: KeyType.textKey, normalText: "9"),
  ];

  static List<List<KeyData>> qwertyKeys = [
    [
      KeyData(type: KeyType.textKey, normalText: "1", shiftedText: "!"),
      KeyData(type: KeyType.textKey, normalText: "2", shiftedText: "\""),
      KeyData(type: KeyType.textKey, normalText: "3", shiftedText: "#"),
      KeyData(type: KeyType.textKey, normalText: "4", shiftedText: "\$"),
      KeyData(type: KeyType.textKey, normalText: "5", shiftedText: "%"),
      KeyData(type: KeyType.textKey, normalText: "6", shiftedText: "&"),
      KeyData(type: KeyType.textKey, normalText: "7", shiftedText: "/"),
      KeyData(type: KeyType.textKey, normalText: "8", shiftedText: "("),
      KeyData(type: KeyType.textKey, normalText: "9", shiftedText: ")"),
      KeyData(type: KeyType.textKey, normalText: "0", shiftedText: "="),
      KeyData(type: KeyType.textKey, normalText: "'", shiftedText: "?"),
      KeyData(type: KeyType.textKey, normalText: "¿", shiftedText: "¡"),
    ],
    [
      KeyData(
          type: KeyType.textKey,
          altTextColor: Colors.grey[200],
          normalText: "q",
          shiftedText: "Q",
          alternativeText: "@"),
      KeyData(type: KeyType.textKey, normalText: "w", shiftedText: "W"),
      KeyData(
          type: KeyType.textKey,
          altTextColor: Colors.grey[200],
          normalText: "e",
          shiftedText: "E",
          alternativeText: "€"),
      KeyData(type: KeyType.textKey, normalText: "r", shiftedText: "R"),
      KeyData(type: KeyType.textKey, normalText: "t", shiftedText: "T"),
      KeyData(type: KeyType.textKey, normalText: "y", shiftedText: "Y"),
      KeyData(type: KeyType.textKey, normalText: "u", shiftedText: "U"),
      KeyData(type: KeyType.textKey, normalText: "i", shiftedText: "I"),
      KeyData(type: KeyType.textKey, normalText: "o", shiftedText: "O"),
      KeyData(type: KeyType.textKey, normalText: "p", shiftedText: "P"),
    ],
    [
      KeyData(type: KeyType.textKey, normalText: "a", shiftedText: "A"),
      KeyData(type: KeyType.textKey, normalText: "s", shiftedText: "S"),
      KeyData(type: KeyType.textKey, normalText: "d", shiftedText: "D"),
      KeyData(type: KeyType.textKey, normalText: "f", shiftedText: "F"),
      KeyData(type: KeyType.textKey, normalText: "g", shiftedText: "G"),
      KeyData(type: KeyType.textKey, normalText: "h", shiftedText: "H"),
      KeyData(type: KeyType.textKey, normalText: "j", shiftedText: "J"),
      KeyData(type: KeyType.textKey, normalText: "k", shiftedText: "K"),
      KeyData(type: KeyType.textKey, normalText: "l", shiftedText: "L"),
      KeyData(type: KeyType.textKey, normalText: "ñ", shiftedText: "Ñ"),
    ],
    [
      KeyData(type: KeyType.textKey, normalText: "z", shiftedText: "Z"),
      KeyData(type: KeyType.textKey, normalText: "x", shiftedText: "X"),
      KeyData(type: KeyType.textKey, normalText: "c", shiftedText: "C"),
      KeyData(type: KeyType.textKey, normalText: "v", shiftedText: "V"),
      KeyData(type: KeyType.textKey, normalText: "b", shiftedText: "B"),
      KeyData(type: KeyType.textKey, normalText: "n", shiftedText: "N"),
      KeyData(type: KeyType.textKey, normalText: "m", shiftedText: "M"),
      KeyData(type: KeyType.textKey, normalText: ",", shiftedText: ";"),
      KeyData(type: KeyType.textKey, normalText: "."),
      KeyData(type: KeyType.textKey, normalText: "-", shiftedText: "_"),
    ],
  ];
}
