import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Добро пожаловать",
            style: TextStyle(
              color: ColorHexTo.mainTextColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Уважаемый сотрудник службы доставки мы оптимизировали работу через систему управления и создали для вас удобное и легкое в пользование приложение здесь вы будете получать заявки на доставку товаров  клиентам и выполнять свои задачи.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorHexTo.mainTextColor,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Удачи Вам и успехов в работе !!!",
            style: TextStyle(
              color: ColorHexTo.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          SvgPicture.asset("assets/images/sent-bro.svg"),
        ],
      ),
    );
  }
}
