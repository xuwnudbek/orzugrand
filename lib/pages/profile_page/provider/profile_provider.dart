import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool _alertStatus = false;
  bool _useFingerPrint = false;
  bool _pinCodeStatus = false;

  get alertStatus => _alertStatus;
  set setAlertStatus(value) {
    _alertStatus = value;
    notifyListeners();
  }

  get pinCodeStatus => _pinCodeStatus;
  set setPinCodeStatus(value) {
    _pinCodeStatus = value;
    notifyListeners();
  }

  get fingerPrintStatus => _useFingerPrint;
  set setFingerPrintStatus(value) {
    _useFingerPrint = value;
    notifyListeners();
  }
}
