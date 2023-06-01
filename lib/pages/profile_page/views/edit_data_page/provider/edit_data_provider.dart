import 'package:flutter/material.dart';
import 'package:orzugrand/models/user.dart';

class EditDataProvider extends ChangeNotifier {
  User user = User.fromMap({
    "name": "Жамшид",
    "sname": "Арзикулов",
    "phone": "+998901234567",
    "city": "Фергана",
    "password": "asd123",
    "address": "Кувасай ул Алишера Н 130 г",
  });

  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool _isPhoneEditable = false;
  bool _isAddressEditable = false;

  bool get isPhoneEditable => isPhoneEditable;
  bool get isAddressEditable => isAddressEditable;

  set changePhoneEditable(bool value) {
    _isPhoneEditable = value;
    notifyListeners();
  }

  set changeAddressEditable(bool value) {
    _isAddressEditable = value;
    notifyListeners();
  }
}
