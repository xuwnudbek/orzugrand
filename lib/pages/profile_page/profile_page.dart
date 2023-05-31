import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/provider/profile_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
      child: Container(
        child: Column(
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
            SizedBox(height: 10),
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
            SizedBox(height: 20),
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
            SizedBox(height: 50),
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
                                Icon(Icons.notifications_none_rounded),
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
                                Icon(Icons.fingerprint_rounded),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 10),
                                Text("Изменить данные"),
                              ],
                            ),
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
                                    "assets/images/edit_pass.svg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Изменить данные"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
