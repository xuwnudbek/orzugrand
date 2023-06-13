import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:orzugrand/controllers/domain/domains.dart';
import 'package:orzugrand/controllers/http/http.dart';
import 'package:orzugrand/models/order.dart';

class NewOrderProvider extends ChangeNotifier {
  List<Order>? orders = [];

  NewOrderProvider() {
    getAllOrders();
  }

  void getAllOrders() async {
    var res = await HttpHelper().get(url: Domains.tasks);
    if (res.statusCode < 299) {
      updateOrders(jsonDecode(res.body)["data"]);
    }
  }

  updateOrders(List? orders) {
    this.orders = orders?.map((e) => Order.fromMap(e)).toList();
    notifyListeners();
    print("New orders: $orders");
  }

  int get orderCount => orders?.length ?? 0;
}
