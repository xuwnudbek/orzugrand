import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Register Button
        CustomButton(
          title: Text(
            "ЗАРЕГЕСТРИРОВАТЬСЯ",
            style: TextStyle(
              color: HexColor.secondaryTextColor,
            ),
          ),
          onTap: () {
            Get.toNamed("/welcome/register");
          },
          height: 40,
          bgColor: HexColor.primaryColor,
        ),
        SizedBox(height: 8),
        Text("или"),
        SizedBox(height: 8),
        //Login Button
        CustomButton(
          title: Text(
            "ВОЙТИ",
            style: TextStyle(
              color: HexColor.secondaryTextColor,
            ),
          ),
          onTap: () {
            Get.toNamed("/welcome/login");
          },
          height: 40,
          bgColor: HexColor.secondaryColor,
        ),
      ],
    );
  }
}
