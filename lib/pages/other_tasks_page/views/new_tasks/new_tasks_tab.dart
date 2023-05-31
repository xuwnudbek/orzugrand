import 'package:flutter/widgets.dart';
import 'package:orzugrand/pages/other_tasks_page/views/new_tasks/provider/new_task_provider.dart';
import 'package:orzugrand/utils/color_hex_to.dart';
import 'package:orzugrand/utils/widgets/other_page/new_task_card.dart';
import 'package:provider/provider.dart';

class NewTasksTab extends StatelessWidget {
  const NewTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskProvider>(
      builder: (context, provider, child) {
        return Column(
          children: provider.getNewTasks
              .map((e) => NewTaskCard(task: e, color: HexColor.blue))
              .toList(),
        );
      },
    );
  }
}
