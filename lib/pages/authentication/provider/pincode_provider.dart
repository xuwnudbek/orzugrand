import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:orzugrand/pages/main_page.dart';

class PincodeProvider extends ChangeNotifier {
  var box = Hive.box("user");
  get password => box.get("password");
  set setPassword(String password) => box.put("password", password);

  get confirmPassword => box.get("isPasswordConfirmed") ?? false;
  set setConfirmPassword(bool isPasswordConfirmed) =>
      box.put("isPasswordConfirmed", isPasswordConfirmed);

  get isSetPassword => box.get("isSetPassword");
  int? currentInputIndex = 0;
  bool isSettingNewPassword = Get.arguments?["isSettingNewPassword"] ?? false;

  String title = "Enter your pincode";

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  setNewPassword() {
    if (password == null) {
      if (controllers[0].text.isNotEmpty &&
          controllers[1].text.isNotEmpty &&
          controllers[2].text.isNotEmpty &&
          controllers[3].text.isNotEmpty) {
        if (controllers[0].text == controllers[1].text &&
            controllers[2].text == controllers[3].text) {
          box.put("password", controllers[0].text);
          box.put("confirmPassword", controllers[2].text);
          box.put("isSetPassword", true);
          Get.offAll(() => MainPage());
        } else {
          Get.snackbar(
            "Error",
            "Password is not match",
            margin: EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Please fill all inputs",
          margin: EdgeInsets.all(20),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      if (controllers[0].text.isNotEmpty &&
          controllers[1].text.isNotEmpty &&
          controllers[2].text.isNotEmpty &&
          controllers[3].text.isNotEmpty) {
        if (controllers[0].text == controllers[1].text &&
            controllers[2].text == controllers[3].text) {
          box.put("password", controllers[0].text);
          box.put("confirmPassword", controllers[2].text);
          box.put("isSetPassword", true);
          Get.offAll(() => MainPage());
        } else {
          Get.snackbar(
            "Error",
            "Password is not match",
            margin: EdgeInsets.all(20),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Please fill all inputs",
          margin: EdgeInsets.all(20),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  getCurrentinputIndex() {
    if (!controllers.last.text.isEmpty) {
      currentInputIndex = null;
    }

    for (var i = 0; i < controllers.length; i++) {
      if (controllers[i].text.isEmpty) {
        currentInputIndex = i;
        break;
      }
    }
    notifyListeners();
  }

  onTap(int num) {
    print("asdasdasdasdasd");
    if (currentInputIndex != null) {
      controllers[currentInputIndex!].text = "$num";
      getCurrentinputIndex();
      if (currentInputIndex == null) {
        checkPassword();
      }
    }
    print("Num:: $currentInputIndex");
  }

  newPass(int num) {
    print("asdasdasdasdasd");
    if (currentInputIndex != null) {
      controllers[currentInputIndex!].text = "$num";
      getCurrentinputIndex();
      if (currentInputIndex == null) {
        if (confirmPassword) {
          String pass =
              controllers.fold("", (prev, element) => prev + element.text);
          setPassword = pass;
          notifyListeners();
          Get.offAll(() => MainPage());
        } else {
          String pass =
              controllers.fold("", (prev, element) => prev + element.text);
          setPassword = pass;
          eraseInputs();
          title = "Confirm your pincode";
          notifyListeners();
        }
      }
    }
    print("Num:: $currentInputIndex");
  }

  checkPassword() async {
    String pass = controllers.fold("", (prev, element) => prev + element.text);
    if (password == pass) {
      Future.delayed(Duration(seconds: 2)).then((value) async {
        controllers.forEach((element) => element.clear());
        getCurrentinputIndex();
        Get.offAll(() => MainPage());
      });

      Get.snackbar(
        margin: EdgeInsets.all(20),
        "Authenicated successfully",
        "Welcome to deliver platform.",
        duration: Duration(seconds: 2),
      );
    } else {
      Future.delayed(Duration(seconds: 2)).then((value) {
        controllers.forEach((element) => element.clear());
        getCurrentinputIndex();
      });

      Get.snackbar(
        margin: EdgeInsets.all(20),
        "Password is incorrect",
        "Welcome to deliver platform.",
        duration: Duration(seconds: 2),
      );
    }
  }

  eraseInputs() {
    controllers.forEach((element) => element.clear());
    getCurrentinputIndex();
  }
}
