import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/pages/order_page/view/details/provider/order_details_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/order_page/order_page_title.dart';
import 'package:provider/provider.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments["order"];
    var odp = Provider.of<OrderDetailsProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomTitle(
              prefix: SvgPicture.asset("assets/images/order-list.svg"),
              title: Row(
                children: [
                  Text(
                    "Заявка №",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${order.contractNumber}",
                    style: TextStyle(
                      fontSize: 20,
                      color: HexColor.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
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
            SingleChildScrollView(),
          ],
        ),
      ),
    );
  }
}
