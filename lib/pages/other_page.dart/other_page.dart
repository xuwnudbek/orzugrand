import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';
import 'package:orzugrand/utils/widgets/order_page/tab_bar.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTitle(
            prefix: SvgPicture.asset(
              "assets/images/like.svg",
              color: HexColor.blue,
            ),
            title: Row(
              children: [
                Text(
                  "Другие задачи",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            suffix: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: HexColor.primaryColor,
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 22,
                  color: HexColor.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          HomeTabbar(),
        ],
      ),
    );
  }
}
