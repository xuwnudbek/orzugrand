import 'package:flutter/material.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/general_details_card.dart';

class OrderDropdown extends StatelessWidget {
  const OrderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // Order order = Get.arguments["order"] ??
    Order order = Order.fromMap({
      "client": "Арзикулов Жамшид Умидович",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "orderedDate": "12.03.2023",
      "phone": "+998998101010",
      "addPhone": "+998998101010",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 123456,
      "product": "Комбинированная плита Artel Milagro 50 00-K белый",
    });

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
          GeneralDetailsCard(order: order, color: HexColor.primaryColor),
        ],
      ),
    );
  }
}
