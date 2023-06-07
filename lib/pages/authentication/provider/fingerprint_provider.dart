import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/pages/profile_page/profile_page.dart';
import 'package:orzugrand/pages/register/register_page.dart';

class FingerprintProvider extends ChangeNotifier {
  var _box = Hive.box("security");
  var _user = Hive.box("user");
  LocalAuthentication _auth = LocalAuthentication();
  bool get isUsingFingerprint => _box.get("fingerprint") ?? false;
  bool get isSetPincode => _box.get("password") ?? false;

  authenticate() async {
    if (isUsingFingerprint) {
      _auth
          .authenticate(localizedReason: "Подтвердите отпечаток пальца")
          .then((value) {
        if (value) {
          Get.to(() => MainPage());
        }
        print("Fingerprint status: $value");
      });
    }
  }

  //Check and save fingerprint status
  set changeFingerprintStatus(bool value) {
    if (value) {
      //if user want to use fingerprint check if his device support it
      _auth.canCheckBiometrics.then((canCheck) async {
        if (canCheck) {
          await _auth
              .authenticate(localizedReason: "Подтвердите отпечаток пальца")
              .then((value) {
            print("Fingerprint status: $value");
            if (value) {
              _box.put("fingerprint", true);
              notifyListeners();

              //Notify user that his fingerprint was added
              Get.snackbar(
                "Успешно",
                "Отпечаток пальца успешно добавлен",
                margin: EdgeInsets.all(5),
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            } else {
              _box.put("fingerprint", false);
              notifyListeners();

              Get.snackbar(
                "Ошибка",
                "Отпечаток пальца не добавлен",
                margin: EdgeInsets.all(5),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          });
        } else {
          _box.put("fingerprint", false);
          notifyListeners();

          //Notify user that his device doesn't support fingerprint scanner
          Get.snackbar(
            "Ошибка",
            "Ваше устройство не поддерживает сканер отпечатка пальца",
            margin: EdgeInsets.all(5),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      });
    } else {
      _box.put("fingerprint", false);
      notifyListeners();
      //Stop authentication
      _auth.stopAuthentication();
    }
  }
}
