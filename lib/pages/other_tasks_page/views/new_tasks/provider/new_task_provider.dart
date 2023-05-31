import 'package:flutter/material.dart';
import 'package:orzugrand/models/task.dart';

class NewTaskProvider extends ChangeNotifier {
  List<Task> _newTasks = [
    Task.fromMap({
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "phone": "+998991234567",
      "contractedDate": "12.03.2023",
    }),
    Task.fromMap({
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "phone": "+998991234567",
      "contractedDate": "12.03.2023",
    }),
    Task.fromMap({
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "phone": "+998991234567",
      "contractedDate": "12.03.2023",
    }),
    Task.fromMap({
      "task": "Привезти мебель со склада",
      "address": "Фергана Азизова 12 д кв 35",
      "phone": "+998991234567",
      "contractedDate": "12.03.2023",
    }),
  ];

  List<Task> get getNewTasks => _newTasks;
}
