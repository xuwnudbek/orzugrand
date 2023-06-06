import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/circle_button.dart';
import 'package:orzugrand/utils/widgets/order_page/order_dropdown.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';
import 'package:orzugrand/utils/widgets/order_page/selfie_card.dart';

class SelfiePage extends StatelessWidget {
  const SelfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Order order = Get.arguments["order"];
    Order order = Order.fromMap({
      "client": "Арзикулов Жамшид Умидович",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "orderedDate": "12.03.2023",
      "phone": "+998998101010",
      "addPhone": "+998998101010",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 123456,
      "product": "Комбинированная плита Artel Milagro 50 00-K белый",
    });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomTitle(
              prefix: SvgPicture.asset("assets/images/order-list.svg"),
              title: Row(
                children: [
                  Text(
                    "Заявка №",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 7),
                  Text(
                    "${order.contractNumber}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              suffix: CircleButton(
                child: SvgPicture.asset("assets/images/send.svg"),
                color: HexColor.primaryColor,
                radius: 40,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Клиент: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: HexColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        //get name & sname //after I could change it
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
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderDropdown(),
                    SizedBox(height: 10),
                    SelfieCard(),
                    SizedBox(height: 20),
                    CustomButton(
                      title: Row(
                        children: [
                          Text(
                            "Сохранить / Выполненно",
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      bgColor: HexColor.secondaryColor,
                      height: 40,
                      onTap: () {
                        print("Saved");
                      },
                    ),
                    SizedBox(height: 20),
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
