import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orzugrand/models/user.dart';

class EditDataProvider extends ChangeNotifier {
  //Get user from Hive
  var _box = Hive.box("user");
  get data => _box.get("data");
  User get user => User.fromJson(data);
  
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool _isPhoneEditable = false;
  bool _isAddressEditable = false;

  bool get isPhoneEditable => _isPhoneEditable;
  bool get isAddressEditable => _isAddressEditable;

  set changePhoneEditable(bool value) {
    _isPhoneEditable = value;
    notifyListeners();
  }

  set changeAddressEditable(bool value) {
    _isAddressEditable = value;
    notifyListeners();
  }
}
