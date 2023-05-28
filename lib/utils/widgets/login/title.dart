import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = Get.size;
    return Row(
      children: [
        Text(
          "Вход в личный кабинет",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),

        // Expanded(
        //   child: Container(
        //     alignment: Alignment.center,
        //     padding: EdgeInsets.only(left: 17),
        //     height: 78,
        //     decoration: BoxDecoration(
        //       color: HexColor.errorColor,
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: ListTile(
        //       dense: true,
        //       leading: SvgPicture.asset("assets/images/warning.svg"),
        //       title: Text(
        //         "Опс",
        //         style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w600,
        //             color: HexColor.secondaryTextColor),
        //       ),
        //       subtitle: Text(
        //         "Вы ввели телефон или пароль не правильно",
        //         style: TextStyle(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w500,
        //             color: HexColor.secondaryTextColor),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
