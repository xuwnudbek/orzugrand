import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/views/edit_data_page/provider/edit_data_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/button.dart';
import 'package:provider/provider.dart';

class EditDataPage extends StatelessWidget {
  const EditDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
          child: Column(
            children: [
              //User image and data
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: HexColor.primaryColor,
                              maxRadius: 30,
                              child: Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor.secondaryTextColor,
                                ),
                              ),
                            ),
                            Text(
                              "Выполнено сегодня",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          maxRadius: 60,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: HexColor.secondaryColor,
                              maxRadius: 30,
                              child: Text(
                                "44",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor.secondaryTextColor,
                                ),
                              ),
                            ),
                            Text(
                              "Выполнено за текущий месяц",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Владимир Владимирович",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Должность",
                    style: TextStyle(
                      fontSize: 12,
                      color: HexColor.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: Get.size.width * 0.5,
                    child: CustomButton(
                      title: Text(
                        "Служба доставки",
                        style: TextStyle(
                          fontSize: 12,
                          color: HexColor.secondaryTextColor,
                        ),
                      ),
                      bgColor: HexColor.primaryColor,
                      height: 40,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              //Data Fields
              Consumer<EditDataProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    Container(
                      width: Get.size.width,
                      constraints: BoxConstraints(
                        maxWidth: Get.size.width,
                      ),
                      child: TextFormField(
                        controller: provider.phoneController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        // initialValue: "${provider.user.phone}",
                        decoration: InputDecoration(
                          label: Text(
                            "Телефон:",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.size.width,
                      constraints: BoxConstraints(
                        maxWidth: Get.size.width,
                      ),
                      child: TextFormField(
                        controller: provider.phoneController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        // initialValue: "${provider.user.city}",
                        decoration: InputDecoration(
                          label: Text(
                            "Город:",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: Get.size.width,
                      constraints: BoxConstraints(
                        maxWidth: Get.size.width,
                      ),
                      child: TextFormField(
                        controller: provider.phoneController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        // initialValue: "${provider.user.address}",
                        decoration: InputDecoration(
                          label: Text(
                            "Адрес:",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
