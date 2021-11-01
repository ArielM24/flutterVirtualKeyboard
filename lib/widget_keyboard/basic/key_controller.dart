import 'package:flutter/foundation.dart';

class KeyboardController {
  KeyboardController() : super();

  bool _isShiftActive = false;
  bool _isSwitched = false;
  bool _isAlternativeActive = false;

  bool get isShiftActive => _isShiftActive;
  bool get isSwitched => _isSwitched;
  bool get isAlternativeActive => _isAlternativeActive;

  void shiftKeys() {
    _isShiftActive = !_isShiftActive;
    debugPrint("shift");
  }

  void switchKeys() {
    _isSwitched = !_isSwitched;
    debugPrint("switched");
  }

  void alternateKeys() {
    _isAlternativeActive = !_isAlternativeActive;
    debugPrint("alternate");
  }
}
