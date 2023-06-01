import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/provider/profile_provider.dart';
import 'package:orzugrand/pages/profile_page/views/edit_data_page/edit_data_page.dart';
import 'package:orzugrand/pages/profile_page/views/edit_pass_page/edit_pass_page.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/profile/user_statictic.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
      child: Column(
        children: [
          //User image and data
          UserStatistics(),
          SizedBox(height: 50),
          //User Opportunities
          Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  "assets/images/notification.svg",
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("Оповещение"),
                            ],
                          ),
                        ),
                        Switch(
                          activeColor: HexColor.primaryColor,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.white,
                          onChanged: (value) {
                            provider.setAlertStatus = value;
                          },
                          value: provider.alertStatus,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  "assets/images/fingerprint.svg",
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("Вход по отпечатку"),
                            ],
                          ),
                        ),
                        Switch(
                          activeColor: HexColor.primaryColor,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.white,
                          onChanged: (value) {
                            provider.setFingerPrintStatus = value;
                          },
                          value: provider.fingerPrintStatus,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => EditDataPage(),
                          transition: Transition.cupertino,
                          // curve: Curves.linear,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    "assets/images/edit.svg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Изменить данные"),
                              ],
                            ),
                          ),
                          SvgPicture.asset("assets/images/arrow_right_ios.svg"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => EditPassPage(),
                          transition: Transition.cupertino,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    "assets/images/edit_pass.svg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Изменить данные"),
                              ],
                            ),
                          ),
                          SvgPicture.asset("assets/images/arrow_right_ios.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
