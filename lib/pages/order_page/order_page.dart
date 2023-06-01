import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orzugrand/pages/order_page/provider/order_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';
import 'package:orzugrand/utils/widgets/order_page/tab_bar.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          CustomTitle(
            prefix: SvgPicture.asset("assets/images/order-list.svg"),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Заявки",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "12+",
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            suffix: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: HexColor.primaryColor,
                child: SvgPicture.asset(
                  "assets/images/notification.svg",
                  color: HexColor.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          OrderTabbar(),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<OrderProvider>(
                builder: (context, provider, child) => provider.currentTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
