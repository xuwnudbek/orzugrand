import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:url_launcher/url_launcher.dart';

class MainFunction {
  static redirectCall(String phoneNumber) async {
    try {
      await launchUrl(Uri.parse("tel:${phoneNumber.replaceAll(" ", '')}"));
    } catch (e) {
      print("ERROR WITH REDIRECT CALL:: $e");
    }
  }

  static getWeekDays() {
    DateTime today = DateTime.now(); //Today is the Monday // weekday is 1

    DateTime monday =
        today.subtract(Duration(days: 7 - (7 - today.weekday) - 1));
    DateTime sunday =
        today.add(Duration(days: today.weekday + (6 - today.weekday)));
    return [monday, sunday];
  }

  static prettyDate(List<DateTime>? date, int index) {
    if (date != null) {
      String prettyDate = date[index].toString().split(" ")[0];
      return prettyDate;
    } else {
      return DateTime.now().toString().split(" ")[0];
    }
  }

  static buildSnackbarNotification({
    required Order order,
    required String msg,
  }) async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        Get.snackbar(
          "${order.contractNumber}",
          "Added to Performers",
          duration: Duration(seconds: 2),
        );
      } else {
        Get.snackbar(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          "${order.contractNumber}",
          "Added to Performers",
          duration: Duration(seconds: 2),
        );
      }
    });
  }
}
