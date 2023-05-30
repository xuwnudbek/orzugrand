import 'package:flutter/material.dart';
import 'package:orzugrand/models/order.dart';

class HomeProvider extends ChangeNotifier {
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
      "product": ["Картошка", "Морковь", "Лук"],
    }),
  ];

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void onChangeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
