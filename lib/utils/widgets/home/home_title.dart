import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: SvgPicture.asset(
            "assets/images/order-list.svg",
          ),
        ),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Заявки",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "12+",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: HexColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              maxRadius: 40,
              backgroundColor: HexColor.primaryColor,
              child: Icon(
                Icons.notifications_none_rounded,
                size: 30,
                color: HexColor.secondaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
