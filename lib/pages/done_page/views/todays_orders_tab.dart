
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/provider/done_provider.dart';
import 'package:orzugrand/pages/done_page/provider/today_order_provider.dart';
import 'package:orzugrand/utils/widgets/done_page/done_order_card.dart';
import 'package:provider/provider.dart';

class TodaysOrdersTab<T> extends StatelessWidget {
  TodaysOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodaysOrdersProvider>(
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
