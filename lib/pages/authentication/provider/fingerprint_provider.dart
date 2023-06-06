import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintProvider extends ChangeNotifier {
  var _box = Hive.box("biometric");
  LocalAuthentication auth = LocalAuthentication();
  late List<BiometricType> _availableBiometrics;
  late bool _canCheckBiometric;
  late bool useBiometric;

  FingerprintProvider() {
    useBiometric = _box.get("onBiometric") ?? false;
  }

  checkFingerprintAuth() async {
    bool isAuth = false;

    try {
      _canCheckBiometric = await auth.canCheckBiometrics;
      _availableBiometrics = await auth.getAvailableBiometrics();

      if (_canCheckBiometric) {
        print(useBiometric);
        if (!useBiometric) {
          isAuth = await auth.authenticate(
            localizedReason: "Scan your finger to use fingerprint",
          );
          await _box.put("onBiometric", isAuth);
        } else {
          isAuth = await auth.stopAuthentication();
          await _box.put("onBiometric", isAuth ? false : null);
        }
      }
    } catch (e) {
      print(e);
    }
    useBiometric = _box.get("onBiometric") ?? false;
    notifyListeners();
  }
}
