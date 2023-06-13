import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:orzugrand/controllers/http/http.dart';
import 'package:orzugrand/controllers/domain/domains.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController snameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController()..text = "1";
  TextEditingController addrController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _passwordObscure = true;
  bool get passwordObscure => _passwordObscure;
  set passwordObscure(bool value) {
    _passwordObscure = value;
    notifyListeners();
  }

  bool _confirmPasswordObscure = true;
  bool get confirmPasswordObscure => _confirmPasswordObscure;
  set confirmPasswordObscure(bool value) {
    _confirmPasswordObscure = value;
    notifyListeners();
  }

  Future<List> get regions async => await HttpHelper().get(url: Domains.regions).then((value) {
        return jsonDecode(value.body);
      });

  get data => {
        "name": nameController.text + " " + snameController.text,
        "email": emailController.text,
        "phone_number": phoneController.text,
        "region_id": cityController.text,
        "address": addrController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
      };

  set changeCity(String value) {
    cityController.text = value;
    notifyListeners();
  }
}
