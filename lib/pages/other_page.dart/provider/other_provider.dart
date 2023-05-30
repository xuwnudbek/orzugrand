import 'package:flutter/material.dart';

class OtherProvider extends ChangeNotifier {
  List<Widget> tabs = [];

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  // get currentTap => screens[_tabIndex];

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
