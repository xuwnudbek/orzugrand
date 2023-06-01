import 'package:flutter/material.dart';
import 'package:orzugrand/pages/returned_page/provider/performed_returned_order_provider.dart';
import 'package:orzugrand/utils/widgets/return_page/return_order_card.dart';
import 'package:provider/provider.dart';

class PerformedReturnedOrderTab extends StatelessWidget {
  const PerformedReturnedOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerformedReturnedOrderProvider>(
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
