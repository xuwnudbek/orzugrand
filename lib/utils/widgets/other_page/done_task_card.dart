import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/task.dart';
import 'package:orzugrand/pages/other_tasks_page/views/task_details/task_details_page.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/general_details_page.dart';

class DoneTaskCard extends StatelessWidget {
  DoneTaskCard({super.key, required this.task});
  Task task;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = HexColor.blue;

    return GestureDetector(
      onTap: () {
        Get.to(
          () => TaskDetailsPage(primaryColor: primaryColor),
          transition: Transition.cupertino,
          arguments: {"task": task},
        );
        //Logic
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Client FIO
            Container(
              width: Get.size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Зада ча:",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "${task.task}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            //Address
            Container(
              width: Get.size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Адрес:",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "${task.address}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Ordered date
            Container(
              width: Get.size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Дата создания договора:",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "${task.contractedDate}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //Order Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //Logic
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Выехал к клиенту",
                          style: TextStyle(color: HexColor.secondaryTextColor),
                        ),
                        SizedBox(width: 7),
                        SvgPicture.asset(
                          "assets/images/deliver-car.svg",
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          MainFunction.redirectCall("+998902902614");
                          print("Call to client: ");
                        },
                        color: primaryColor,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            primaryColor,
                          ),
                        ),
                        icon: SvgPicture.asset("assets/images/phone.svg"),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(
                            () => GeneralDetailsPage(primaryColor: primaryColor),
                            // arguments: {"order": order, "isPrimary": true},
                          );
                          print("Forward to Order");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            primaryColor,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: HexColor.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
