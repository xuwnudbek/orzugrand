import 'package:flutter/material.dart';
import 'package:orzugrand/pages/other_tasks_page/views/done_tasks/done_tasks_page.dart';
import 'package:orzugrand/pages/other_tasks_page/views/new_tasks/new_tasks_tab.dart';

class OtherTasksProvider extends ChangeNotifier {
  List<Widget> tabs = [NewTasksTab(), DoneTasksTab()];

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  get currentTab => tabs[_tabIndex];

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
