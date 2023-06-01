import 'package:flutter/material.dart';
import 'package:orzugrand/pages/returned_page/views/new_retured_orders_tab.dart';
import 'package:orzugrand/pages/returned_page/views/performed_returned_order_tab.dart';

class ReturnProvider extends ChangeNotifier {
  List<Widget> _tabs = [
    NewReturnedOrdersTab(),
    PerformedReturnedOrderTab(),
  ];

  int _currentTabIndex = 0;

  get tabIndex => _currentTabIndex;
  get currentTab => _tabs[_currentTabIndex];

  set changeTabIndex(value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
