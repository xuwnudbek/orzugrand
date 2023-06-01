import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/all_time_orders_provider.dart';
import 'package:orzugrand/utils/widgets/done_page/done_order_card.dart';
import 'package:provider/provider.dart';

class AllTimeOrdersTab extends StatelessWidget {
  const AllTimeOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllTimeOrdersProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: provider.orders
                  .map(
                    (e) => DoneOrderCard(order: e),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
