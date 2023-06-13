import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  static dialog(String title, String content, {List<Widget>? actions}) {
    return Get.defaultDialog(
      actions: actions,
      title: title,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Text("$content", textAlign: TextAlign.center),
      ),
      barrierDismissible: false,
    );
  }
}
