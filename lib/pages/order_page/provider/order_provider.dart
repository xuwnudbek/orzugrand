import 'package:flutter/material.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/pages/order_page/views/new_orders_tab/new_order_page.dart';
import 'package:orzugrand/pages/order_page/views/performed_orders_tab/performed_order_page.dart';

class OrderProvider extends ChangeNotifier {
  List<Widget> screens = [
    NewOrderPage(),
    PerformedOrderPage(),
  ];

  List<Order> orders = [
    Order.fromMap({
      "client": "Арзикулов Жамшид Умидович",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "orderedDate": "12.03.2023",
      "phone": "+998998101010",
      "addPhone": "+998998101010",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 123456,
      "product": "Комбинированная плита Artel Milagro 50 00-K белый",
    }),
    Order.fromMap({
      "client": "Арзикулов Жамшид Умидович",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "orderedDate": "12.03.2023",
      "phone": "+998998101010",
      "addPhone": "+998998101010",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 123456,
      "product": "Комбинированная плита Artel Milagro 50 00-K белый",
    }),
  ];

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  get currentTap => screens[_tabIndex];

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
