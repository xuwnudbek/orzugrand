import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/main_page.dart';
import 'package:orzugrand/utils/snackbar/custom_snackbars.dart';

class PincodeProvider extends ChangeNotifier {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int? currentInputIndex = 0;
  String pass = "1234";

  //get input password
  String get getInputPass =>
      controllers.fold("", (prev, controller) => prev + controller.text);

  //when user click on tab button
  onTabButton(int num) {
    print(num);
    if (currentInputIndex != null) {
      controllers[currentInputIndex!].text = "$num";
      if (currentInputIndex == 3) {
        checkPass();
      }
      getCurrentInputIndex();
    } else {
      checkPass();
    }
  }

  //get current input index
  getCurrentInputIndex() {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.isEmpty) {
        currentInputIndex = i;
        break;
      } else {
        currentInputIndex = null;
      }
    }
    print("currentInputIndex: $currentInputIndex");
    notifyListeners();
  }

  //when all input is full then check password
  checkPass() {
    if (getInputPass == pass) {
      CustomSnackbars.success("Successfully logged in");
      eraseInputsAll();
      Get.offAll(() => MainPage());
    } else {
      CustomSnackbars.error("Wrong password");
      eraseInputsAll();
    }
  }

  //when user click on delete button erase
  eraseInputs() {
    if (currentInputIndex != null) {
      if (currentInputIndex! > 0) {
        controllers[currentInputIndex! - 1].clear();
        notifyListeners();
        getCurrentInputIndex();
      }
    } else {
      print(currentInputIndex);
      controllers[controllers.length - 1].clear();
      notifyListeners();
      getCurrentInputIndex();
    }
  }

  eraseInputsAll() {
    controllers.forEach((element) {
      element.clear();
    });
    currentInputIndex = 0;
    notifyListeners();
    getCurrentInputIndex();
  }
}
