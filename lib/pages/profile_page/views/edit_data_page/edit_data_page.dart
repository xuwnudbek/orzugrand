import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/views/edit_data_page/provider/edit_data_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';
import 'package:orzugrand/utils/widgets/profile/user_statictic.dart';
import 'package:provider/provider.dart';

class EditDataPage extends StatelessWidget {
  EditDataPage({super.key});

  var cities = [
    "Farg'ona",
    "Namangan",
    "Samanrqand",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
          child: Column(
            children: [
              //User image and data
              UserStatistics(),
              //Data Fields
              Consumer<EditDataProvider>(builder: (context, provider, child) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: Get.size.width,
                            maxHeight: Get.size.width,
                          ),
                          child: TextFormField(
                            controller: provider.phoneController,
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                "Телефон:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: HexColor.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  provider.changePhoneEditable =
                                      !provider.isPhoneEditable;
                                },
                                child: SvgPicture.asset(
                                  "assets/images/edit_pen.svg",
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor.primaryColor,
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 20,
                                minWidth: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Город:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: HexColor.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  SizedBox(
                                      height: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            DropdownButton(
                                              icon: SizedBox.shrink(),
                                              underline: SizedBox.shrink(),
                                              focusColor: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              value: cities.first,
                                              items: cities
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        "$e",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (e) {},
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: Get.size.width,
                            maxHeight: Get.size.width,
                          ),
                          child: TextFormField(
                            controller: provider.phoneController,
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              label: Text(
                                "Адрес:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: HexColor.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  provider.changePhoneEditable =
                                      !provider.isPhoneEditable;
                                },
                                child: SvgPicture.asset(
                                  "assets/images/edit_pen.svg",
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: HexColor.primaryColor,
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 20,
                                minWidth: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          title: Text(
                            "Сохранить",
                            style: TextStyle(
                              color: HexColor.secondaryTextColor,
                            ),
                          ),
                          height: 40,
                          bgColor: HexColor.secondaryColor,
                          onTap: () {
                            //Logic
                            print("Saved");
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
