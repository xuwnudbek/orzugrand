import 'package:flutter/material.dart';
import 'package:orzugrand/pages/order_page/views/performed_orders_tab/provider/performed_order_provider.dart';
import 'package:orzugrand/utils/widgets/order_page/performed_order_card.dart';

import 'package:provider/provider.dart';

class PerformedOrderPage extends StatelessWidget {
  const PerformedOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerformedOrderProvider>(
      builder: (context, provider, _) {
        return Column(
          children: provider.orders
              .map(
                (e) => PerformedOrderCard(order: e),
              )
              .toList(),
        );
      },
    );
  }
}
