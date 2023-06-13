import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveProvider extends ChangeNotifier {
  var user = Hive.box("user");
  get token => user.get("token");
  get isAuth => token != null;

  HiveProvider() {
    user.watch(key: "token").listen((event) {
      notifyListeners();
    });
  }
}
