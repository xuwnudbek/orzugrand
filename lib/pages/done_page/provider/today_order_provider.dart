import 'package:flutter/foundation.dart';
import 'package:orzugrand/models/order.dart';

class TodaysOrdersProvider extends ChangeNotifier {
  List<Order> orders = [];
}
