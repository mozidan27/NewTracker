import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_model.dart';
import 'package:new_tracker/pages/dashboard_page/widgets/card_task_stat.dart';

class TaskSummaryRow extends StatelessWidget {
  const TaskSummaryRow({
    super.key,
    required this.tasks,
    required this.todayTasks,
    required this.highPriorityTasks,
  });

  final List<Task> tasks;
  final List<Task> todayTasks;
  final List<Task> highPriorityTasks;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        cardTaskStat("Total Tasks", tasks.length, Colors.grey.shade600),
        cardTaskStat("Today's Tasks", todayTasks.length, Colors.green.shade600),
        cardTaskStat(
            "High Priority", highPriorityTasks.length, Colors.grey.shade600),
      ],
    );
  }
}
