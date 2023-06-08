import 'package:flutter/material.dart';
import 'package:orzugrand/models/task.dart';

class DoneTaskProvider extends ChangeNotifier {
  List<Task> _doneTasks = [
    Task.fromMap({
      "id": 1,
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "contractedDate": "12.03.2023",
      "phone": "+998991234567",
    }),
    Task.fromMap({
      "id": 2,
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "contractedDate": "12.03.2023",
      "phone": "+998991234567",
    }),
  ];

  List<Task> get getDoneTasks => _doneTasks;
}
