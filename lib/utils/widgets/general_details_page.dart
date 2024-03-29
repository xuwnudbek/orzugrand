import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/general_details_card.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';

class GeneralDetailsPage extends StatelessWidget {
  GeneralDetailsPage({super.key, required this.primaryColor});

  final Color primaryColor;
  final Order order = Get.arguments["order"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomTitle(
              prefix: SvgPicture.asset(
                "assets/images/order-list.svg",
                color: primaryColor,
              ),
              title: Row(
                children: [
                  Text(
                    "Заявка №",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${order.contractNumber}",
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              suffix: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: 22,
                    color: HexColor.secondaryTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_rounded),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Клиент: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${order.client.split(" ")[0]} ${order.client.split(" ")[1]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GeneralDetailsCard(color: primaryColor, order: order),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
