import 'package:flutter/material.dart';
import 'package:orzugrand/pages/order_page/view/new_orders_tab/provider/new_order_provider.dart';
import 'package:orzugrand/utils/widgets/order_page/new_order_card.dart';
import 'package:provider/provider.dart';

class NewOrderPage extends StatelessWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var np = Provider.of<NewOrderProvider>(context);
    return Column(
      children: np.orders.map((e) => NewOrderCard(order: e)).toList(),
    );
  }
}
