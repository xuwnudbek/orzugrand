import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/pages/order_page/views/details/order_details_page.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';

class ReturnOrderCard extends StatelessWidget {
  ReturnOrderCard({super.key, required this.order});
  Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Logic
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor.darkRed.withOpacity(0.1),
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
                      color: HexColor.darkRed,
                    ),
                  ),
                  Text(
                    "554445",
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
                      color: HexColor.darkRed,
                    ),
                  ),
                  Text(
                    "asdasd asdad asdasd",
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
                      color: HexColor.darkRed,
                    ),
                  ),
                  Text(
                    "asda564da6sd ",
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
                      color: HexColor.darkRed,
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
                        color: HexColor.darkRed,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            HexColor.darkRed,
                          ),
                        ),
                        icon: SvgPicture.asset("assets/images/phone.svg"),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(
                            () => OrderDetailsPage(),
                            // arguments: {"order": order, "isPrimary": true},
                          );
                          print("Forward to Order");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            HexColor.darkRed,
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
