import 'package:flutter/material.dart';
import 'package:orzugrand/pages/other_tasks_page/views/done_tasks/provider/done_task_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/other_page/done_task_card.dart';
import 'package:provider/provider.dart';

class DoneTasksTab extends StatelessWidget {
  const DoneTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoneTaskProvider>(
      builder: (context, provider, child) {
        return Column(
          children: provider.getDoneTasks
              .map((e) => DoneTaskCard(task: e, color: HexColor.blue))
              .toList(),
        );
      },
    );
  }
}
