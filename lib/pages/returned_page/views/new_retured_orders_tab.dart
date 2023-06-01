import 'package:flutter/material.dart';
import 'package:orzugrand/pages/returned_page/provider/new_returned_order_provider.dart';
import 'package:orzugrand/utils/widgets/return_page/return_order_card.dart';
import 'package:provider/provider.dart';

class NewReturnedOrdersTab extends StatelessWidget {
  const NewReturnedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewReturnedOrderProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: provider.orders
                  .map(
                    (e) => ReturnOrderCard(order: e),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
