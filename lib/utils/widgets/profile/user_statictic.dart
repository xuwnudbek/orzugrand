import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/custom_button.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundColor: Colors.grey,
                  ),
                  Align(
                    child: Icon(Icons.abc),
                  ),
                ],
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
            height: 30,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
