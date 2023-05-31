import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/order_page/order_details_card.dart';

class OrderDropdown extends StatelessWidget {
  const OrderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments["order"];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HexColor.primaryColor.withOpacity(0.07),
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
        ),
        collapsedShape: BeveledRectangleBorder(),
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          "Договор: № ${order.contractNumber}",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: HexColor.primaryColor,
          ),
        ),
        iconColor: HexColor.primaryColor,
        collapsedIconColor: HexColor.primaryColor,
        textColor: HexColor.primaryColor,
        children: [
          OrderDetailsCard(true, false),
        ],
      ),
    );
  }
}
