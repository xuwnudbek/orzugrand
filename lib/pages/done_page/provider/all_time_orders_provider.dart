import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:orzugrand/models/order.dart';
import 'package:orzugrand/utils/functions/main_function.dart';

class AllTimeOrdersProvider extends ChangeNotifier {
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

  AllTimeOrdersProvider() {
    this.setDate = MainFunction.getWeekDays();
    notifyListeners();
  }

  var _dateRange;
  get dateRange => _dateRange;
  set setDate(List<DateTime>? datetime) {
    _dateRange = datetime;
  }

  bool get isDateRangeSelected => _dateRange != null;

  //Select DateRange
  Future<bool> selectDateRange(BuildContext context, Color color) async {
    _dateRange = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.range,
            selectedDayTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            selectedRangeHighlightColor: color.withOpacity(0.1),
            selectedDayHighlightColor: color,
          ),
          dialogSize: const Size(325, 400),
          value: _dateRange,
          borderRadius: BorderRadius.circular(15),
        ) ??
        () {
          if (_dateRange == null) {
            return MainFunction.getWeekDays();
          } else {
            return _dateRange;
          }
        }.call();
    notifyListeners();
    print(_dateRange);

    return true;
  }

  //Get all orders
  // getAllOrders() async {}
}
