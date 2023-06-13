import 'package:flutter/material.dart';

import 'package:orzugrand/pages/order_page/views/new_orders_tab/new_order_page.dart';
import 'package:orzugrand/pages/order_page/views/performed_orders_tab/performed_order_page.dart';

class OrderProvider extends ChangeNotifier {
  List<Widget> screens = [
    NewOrderPage(),
    PerformedOrderPage(),
  ];

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  get currentTap => screens[_tabIndex];

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
