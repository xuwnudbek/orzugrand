import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/pages/order_page/components/details/provider/order_details_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:provider/provider.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments["order"];
    var odp = Provider.of<OrderDetailsProvider>(context);
    print(order);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HexColor.primaryColor.withOpacity(0.1),
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
                  "Клиент:",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: HexColor.primaryColor,
                  ),
                ),
                Text(
                  "${order.client}",
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
                    color: HexColor.primaryColor,
                  ),
                ),
                Text(
                  "${order.addressDelivery}",
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
                    color: HexColor.primaryColor,
                  ),
                ),
                Text(
                  "${order.orderedDate}",
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
                    color: HexColor.primaryColor,
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
                        width: 20,
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
                        print("Call to client: ${order.phone}");
                      },
                      color: HexColor.secondaryColor,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          HexColor.secondaryColor,
                        ),
                      ),
                      icon: SvgPicture.asset("assets/images/phone.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        print("Forward to Order");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          HexColor.secondaryColor,
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
    );
  }
}
