import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/pages/profile_page/views/edit_pass_page/provider/edit_pass_provider.dart';
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
              SizedBox(height: 50),
              //Data Fields
              Consumer<EditPassProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    Container(
                      width: Get.size.width,
                      constraints: BoxConstraints(
                        maxWidth: Get.size.width,
                      ),
                      child: TextFormField(
                        obscureText: !provider.isCurrentPasswordVisible,
                        controller: provider.currentPasswordController,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                          fontWeight: FontWeight.w600,
                        ),
                        // initialValue: "${provider.user.phone}",
                        decoration: InputDecoration(
                          label: Text(
                            "Старый пароль:",
                            style: TextStyle(fontSize: 12),
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              provider.changeCurrentPasswordVisible =
                                  !provider.isCurrentPasswordVisible;
                            },
                            child: SvgPicture.asset(
                              "assets/images/${provider.isCurrentPasswordVisible ? "eye" : "close-eye"}.svg",
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
                        // initialValue: "${provider.user.city}",
                        decoration: InputDecoration(
                          label: Text(
                            "Новый пароль:",
                            style: TextStyle(fontSize: 12),
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
                        controller: provider.confirmNewPasswordController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        // initialValue: "${provider.user.address}",
                        decoration: InputDecoration(
                          label: Text(
                            "Подтвердите новый пароль:",
                            style: TextStyle(fontSize: 12),
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
                    SizedBox(height: 20),
                    CustomButton(
                      title: Text("Сохранить"),
                      height: 40,
                      onTap: () {
                        //Logic
                        print("Saved");
                      },
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
