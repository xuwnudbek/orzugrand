import 'package:flutter/material.dart';
import 'package:orzugrand/pages/order_page/components/performed_orders_tab/provider/performed_order_provider.dart';
import 'package:orzugrand/utils/widgets/order_page/performed_order_card.dart';

import 'package:provider/provider.dart';

class PerformedOrderPage extends StatelessWidget {
  const PerformedOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<PerformedOrderProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: pp.orders.map((e) => PerformedOrderCard(order: e)).toList(),
      ),
    );
  }
}
