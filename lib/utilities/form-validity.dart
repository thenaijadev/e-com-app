import 'package:flutter/foundation.dart';

class ValidityData extends ChangeNotifier {
  bool isValid = true;
  bool isUserNotFound = false;
  bool isWrongPassword = false;

  void isFalse() {
    isValid = false;

    notifyListeners();
  }

  void isTrue() {
    isValid = true;
    isWrongPassword = false;
    isUserNotFound = false;
    notifyListeners();
  }

  void userNotFound() {
    isUserNotFound = true;
    notifyListeners();
  }

  void wrongPassword() {
    isWrongPassword = true;
    notifyListeners();
  }
}
