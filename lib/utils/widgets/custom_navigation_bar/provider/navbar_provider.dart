import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  List<Item> items = [
    Item(
      svgPath: "assets/images/navbar/order.svg",
      widget: null,
      index: 0,
      label: "Заявки",
    ),
    Item(
      svgPath: "assets/images/navbar/done.svg",
      widget: null,
      index: 1,
      label: "Готовые",
    ),
    Item(
      svgPath: "assets/images/navbar/return.svg",
      widget: null,
      index: 2,
      label: "Возврат",
    ),
    Item(
      svgPath: "assets/images/navbar/other.svg",
      widget: null,
      index: 3,
      label: "Другие",
    ),
    Item(
      svgPath: "assets/images/navbar/profile.svg",
      widget: null,
      index: 4,
      label: "Профиль",
    ),
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set chandeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class Item {
  int index;
  String svgPath;
  Widget? widget;
  String label;

  Item({
    required this.index,
    required this.svgPath,
    required this.label,
    this.widget,
  });
}
