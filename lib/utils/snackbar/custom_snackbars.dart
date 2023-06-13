import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  static success(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Success",
      "$msg",
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 2000),
    );
  }

  static error(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Error",
      "$msg",
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 2000),
    );
  }

  static warning(String msg) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Warning",
      "$msg",
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      icon: Icon(
        Icons.warning_amber_outlined,
        color: Colors.white,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      margin: EdgeInsets.all(10),
      duration: Duration(milliseconds: 2000),
    );
  }
}
