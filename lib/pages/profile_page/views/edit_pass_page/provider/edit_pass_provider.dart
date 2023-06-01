import 'package:flutter/material.dart';

class EditPassProvider extends ChangeNotifier {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool get isCurrentPasswordVisible => _isCurrentPasswordVisible;
  set changeCurrentPasswordVisible(bool value) {
    _isCurrentPasswordVisible = value;
    notifyListeners();
  }

  bool _isNewPasswordVisible = false;
  bool get isNewPasswordVisible => _isNewPasswordVisible;
  set changeNewPasswordVisible(bool value) {
    _isNewPasswordVisible = value;
    notifyListeners();
  }

  bool _isConfirmPasswordVisible = false;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  set changeConfirmPasswordVisible(bool value) {
    _isConfirmPasswordVisible = value;
    notifyListeners();
  }
}
