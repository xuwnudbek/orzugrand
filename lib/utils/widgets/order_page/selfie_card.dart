import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/pages/order_page/views/selfie_page/provider/selfie_provider.dart';
import 'package:orzugrand/pages/yandex_map_page/map_page.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/circle_button.dart';
import 'package:provider/provider.dart';

class SelfieCard extends StatelessWidget {
  const SelfieCard({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments["order"];

    return Consumer<SelfieProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: HexColor.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Добавьте селфи с клиентом:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                      ),
                      child: provider.imgName.isEmpty
                          ? Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Image.asset("assets/images/question.png"),
                            )
                          : Image.file(
                              File("${provider.imgName}"),
                              fit: BoxFit.cover,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: child,
                                );
                              },
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          CustomButton(
                            onTap: () {
                              provider.pickImg();
                            },
                            title: Row(
                              children: [
                                Text(
                                  "Добавить",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor.secondaryTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                SvgPicture.asset("assets/images/add.svg"),
                              ],
                            ),
                            height: 40,
                            bgColor: HexColor.secondaryColor,
                          ),
                          SizedBox(height: 5),
                          Text("или"),
                          SizedBox(height: 5),
                          CustomButton(
                            title: Row(
                              children: [
                                Text(
                                  "Удалить",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor.secondaryTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                SvgPicture.asset("assets/images/delete.svg"),
                              ],
                            ),
                            height: 40,
                            bgColor: HexColor.errorColor,
                            onTap: () {
                              provider.deleteImg();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Добавьте локацию:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Адрес:",
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${order.addressDelivery}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Get.to(() => PickAddress());
                      },
                      title: Text(
                        "Добавить",
                        style: TextStyle(
                          color: HexColor.secondaryTextColor,
                        ),
                      ),
                      height: 40,
                      bgColor: HexColor.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: CircleButton(
                      child: SvgPicture.asset("assets/images/location.svg"),
                      color: HexColor.primaryColor,
                      radius: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Добавьте комментарий:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor.secondaryTextColor,
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 4,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: HexColor.secondaryTextColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: HexColor.secondaryTextColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: HexColor.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
