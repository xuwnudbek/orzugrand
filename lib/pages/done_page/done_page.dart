import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orzugrand/pages/done_page/provider/done_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/done_page/tab_bar.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';
import 'package:provider/provider.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTitle(
            prefix: SvgPicture.asset(
              "assets/images/like.svg",
              color: HexColor.darkBlue,
            ),
            title: Row(
              children: [
                Text(
                  "Выполненные Заявки",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            suffix: CircleAvatar(
              backgroundColor: HexColor.primaryColor,
              child: SvgPicture.asset(
                "assets/images/notification.svg",
                color: HexColor.secondaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          //DoneTabbar
          DoneTabbar(),
          SizedBox(height: 10),
          //Order cards
          Consumer<DoneProvider>(
            builder: (context, provider, child) {
              return provider.currentTab;
            },
          )
        ],
      ),
    );
  }
}
