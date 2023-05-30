import 'package:flutter/material.dart';
import 'package:orzugrand/models/order.dart';

class NewOrderProvider extends ChangeNotifier {
  List<Order> orders = [
    Order.fromMap({
      "addPhone": "+998902902614",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "client": "Арзикулов Жамшид Умидович",
      "orderedDate": "12.03.2023",
      "phone": "+998998101010",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 123456,
      "product": ["Картошка", "Морковь", "Лук"],
    }),
    Order.fromMap({
      "addPhone": "+998919992614",
      "addressDelivery": "Фергана Азизова 12 д кв 35",
      "client": "Арзикулов Жамшид Умидович",
      "orderedDate": "12.03.2023",
      "phone": "+998931255689",
      "city": "Фергана",
      "clientComment": "Нужно доставить после работы по времени после 17:00",
      "contractNumber": 987654,
      "product": ["Картошка", "Морковь", "Лук"],
    }),
  ];

  int get orderCount => orders.length;
}
