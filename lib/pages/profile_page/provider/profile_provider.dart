import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool _alertStatus = false;
  bool _useFingerPrint = false;

  get alertStatus => _alertStatus;
  set setAlertStatus(value) {
    _alertStatus = value;
    notifyListeners();
  }

  get fingerPrintStatus => _useFingerPrint;
  set setFingerPrintStatus(value) {
    _useFingerPrint = value;
    notifyListeners();
  }


  
}
