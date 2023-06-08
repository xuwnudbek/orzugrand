import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';

class FingerprintProvider extends ChangeNotifier {
  var _box = Hive.box("security");

  LocalAuthentication _auth = LocalAuthentication();
  bool get isUsingFingerprint => _box.get("fingerprint") ?? false;
  bool get isSetPincode => _box.get("password") ?? false;

  authenticate() async {
    try {
      if (isUsingFingerprint) {
        _auth
          ..authenticate(localizedReason: "Подтвердите отпечаток пальца")
              .then((value) {
            if (value) {
              Get.offAll(() => MainPage());
              CustomSnackbars.success("Авторизация успешна");
            }
            print("Fingerprint status: $value");
          });
      }
    } catch (e) {
      assert(e is PlatformException);
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
              CustomSnackbars.success("Отпечаток пальца добавлен");
            } else {
              _box.put("fingerprint", false);
              notifyListeners();

              //Notify user that his fingerprint wasn't added
              CustomSnackbars.error("Отпечаток пальца не добавлен");
            }
          });
        } else {
          _box.put("fingerprint", false);
          notifyListeners();

          //Notify user that his device doesn't support fingerprint scanner
          CustomSnackbars.error("Отпечаток пальца не поддерживается");
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
