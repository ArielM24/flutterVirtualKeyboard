import 'package:flutter/foundation.dart';

class KeyController with ChangeNotifier {
  KeyController() : super();

  bool _isAlternativeActive = false;
  bool _isSwitched = false;

  bool get isAlternativeActive => _isAlternativeActive;
  bool get isSwitched => _isSwitched;

  void alternateKeys() {
    _isAlternativeActive = !_isAlternativeActive;
    debugPrint("alternate");
  }

  void switchKeys() {
    _isSwitched = !_isSwitched;
    debugPrint("switched");
    notifyListeners();
  }
}
