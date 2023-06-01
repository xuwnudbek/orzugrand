import 'package:flutter/material.dart';
import 'package:orzugrand/pages/done_page/views/all_time_orders_tab.dart';
import 'package:orzugrand/pages/done_page/views/todays_orders_tab.dart';

class DoneProvider extends ChangeNotifier {
  List<Widget> _tabs = [
    TodaysOrdersTab(),
    AllTimeOrdersTab(),
  ];

  int _currentTabIndex = 0;

  get tabIndex => _currentTabIndex;
  get currentTab => _tabs[_currentTabIndex];

  set changeTabIndex(value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
