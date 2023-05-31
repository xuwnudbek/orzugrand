import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orzugrand/models/task.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Task task = Get.arguments["task"];
    Color color = Get.arguments["color"];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Details Page"),
          ],
        ),
      ),
    );
  }
}
