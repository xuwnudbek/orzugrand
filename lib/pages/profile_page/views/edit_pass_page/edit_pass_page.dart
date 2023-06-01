import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/views/edit_pass_page/provider/edit_pass_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/button.dart';
import 'package:orzugrand/utils/widgets/profile/user_statictic.dart';
import 'package:provider/provider.dart';

class EditPassPage extends StatelessWidget {
  const EditPassPage({super.key});

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Изменить пароль",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Consumer<EditPassProvider>(
                          builder: (context, provider, child) {
                        return Column(
                          children: [
                            Container(
                              width: Get.size.width,
                              constraints: BoxConstraints(
                                maxWidth: 400,
                                maxHeight: 400,
                              ),
                              child: TextFormField(
                                obscureText: !provider.isCurrentPasswordVisible,
                                obscuringCharacter: "*",
                                controller: provider.currentPasswordController,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                // initialValue: "${provider.user.phone}",
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Старый пароль:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  //Border
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  //End Border
                                  suffix: GestureDetector(
                                    onTap: () {
                                      provider.changeCurrentPasswordVisible =
                                          !provider.isCurrentPasswordVisible;
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/edit_pen.svg",
                                    ),
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    maxHeight: 24,
                                    maxWidth: 24,
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
                                obscureText: !provider.isNewPasswordVisible,
                                controller: provider.newPasswordController,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Новый пароль:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      provider.changeNewPasswordVisible =
                                          !provider.isNewPasswordVisible;
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/${provider.isNewPasswordVisible ? "eye" : "close-eye"}.svg",
                                    ),
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    maxHeight: 24,
                                    maxWidth: 24,
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
                                obscureText: !provider.isConfirmPasswordVisible,
                                controller:
                                    provider.confirmNewPasswordController,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Подтвердите новый пароль:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  isDense: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: HexColor.primaryColor,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      provider.changeConfirmPasswordVisible =
                                          !provider.isConfirmPasswordVisible;
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/${provider.isConfirmPasswordVisible ? "eye" : "close-eye"}.svg",
                                    ),
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    maxHeight: 24,
                                    maxWidth: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 30),
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
              ),
              //Data Fields
            ],
          ),
        ),
      ),
    );
  }
}
