import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/functions/main_function.dart';
import 'package:orzugrand/utils/widgets/circle_button.dart';

class DoneDetailsCard extends StatelessWidget {
  DoneDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments["order"];

    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: HexColor.darkBlue.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Product
              Container(
                width: Get.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Товар:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor.secondaryColor,
                      ),
                    ),
                    Text(
                      "${order.product}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Contract Number
              Container(
                width: Get.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Договор:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor.secondaryColor,
                      ),
                    ),
                    Text(
                      "№ ${order.contractNumber}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                        color: HexColor.secondaryColor,
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
              SizedBox(height: 10),
              //City
              Container(
                width: Get.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Город:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor.secondaryColor,
                      ),
                    ),
                    Text(
                      "${order.city}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Comment from Client
              Container(
                width: Get.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Комментарий от клиента:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: HexColor.secondaryColor,
                      ),
                    ),
                    Text(
                      "${order.clientComment}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Address Delivery
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Адрес доставки:",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor.secondaryColor,
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
                    GestureDetector(
                      onTap: () {
                        print("Location service");
                      },
                      child: CircleButton(
                        radius: 35,
                        child: SvgPicture.asset("assets/images/location.svg"),
                        color: HexColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Phone Number
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Номер телефона:",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor.secondaryColor,
                          ),
                        ),
                        Text(
                          "${order.phone}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        MainFunction.redirectCall(order.phone);
                        print("Location service");
                      },
                      child: CircleButton(
                        radius: 35,
                        child: SvgPicture.asset("assets/images/phone.svg"),
                        color: HexColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Additional Phone Number
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Дополнительный телефон:",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor.secondaryColor,
                          ),
                        ),
                        Text(
                          "${order.addPhone}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        MainFunction.redirectCall(order.addPhone);
                        print("Location service");
                      },
                      child: CircleButton(
                        radius: 35,
                        child: SvgPicture.asset("assets/images/phone.svg"),
                        color: HexColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        //Deliver Button
      ],
    );
  }
}
