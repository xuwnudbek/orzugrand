import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/all_time_orders_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/done_page/done_order_card.dart';
import 'package:orzugrand/utils/widgets/show_date_range.dart';
import 'package:provider/provider.dart';

class AllTimeOrdersTab extends StatelessWidget {
  const AllTimeOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    var allTimeOrdersProvider = Provider.of<AllTimeOrdersProvider>(context);

    return Consumer<AllTimeOrdersProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: Column(
            children: [
              ShowDateRange(
                primaryColor: HexColor.darkBlue,
                provider: allTimeOrdersProvider,
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: provider.orders
                        .map(
                          (e) => DoneOrderCard(order: e),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
