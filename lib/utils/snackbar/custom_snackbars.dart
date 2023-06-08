import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  static success(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Success",
      "$msg",
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 1500),
    );
  }

  static error(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Error",
      "$msg",
      colorText: Colors.white,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 1500),
    );
  }

  static warning(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Warning",
      "$msg",
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 1500),
    );
  }
}
