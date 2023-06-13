import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orzugrand/controllers/domain/domains.dart';
import 'package:orzugrand/controllers/http/http.dart';
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<bool> register({required Map<String, dynamic> body}) async {
    isLoading = true;
    notifyListeners();
    var res = await HttpHelper().post(url: Domains.register, data: body);
    if (res.statusCode < 299) {
      Hive.box("user").put("token", jsonDecode(res.body)["token"]);
      CustomSnackbars.success("You have successfully registered");

      isLoading = false;
      notifyListeners();
      return true;
    } else {
      CustomSnackbars.error("${res.body.contains("email") ? "Email already exists" : ""}");
    }
    isLoading = false;
    notifyListeners();

    return false;
  }

  login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
    var res = await HttpHelper().post(url: Domains.login, data: {"email": email, "password": password});
    if (res.statusCode < 299) {
      Hive.box("user").put("token", jsonDecode(res.body)["token"]);
      CustomSnackbars.success("You have successfully logged in");

      isLoading = false;
      notifyListeners();
      return true;
    } else {
      print(res.body);
      // CustomSnackbars.error("");
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
