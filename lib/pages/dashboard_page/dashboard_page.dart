import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_provider_model.dart';
import 'package:new_tracker/pages/dashboard_page/widgets/floating_action_button.dart';
import 'package:new_tracker/pages/dashboard_page/widgets/task_summary_row.dart';
import 'package:new_tracker/pages/task_list_page/task_list_page.dart';
import 'package:new_tracker/pages/welcome_page/widgets/my_button.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;
    final today = DateTime.now();
    final todayTasks = tasks.where((task) {
      return task.dueDate.year == today.year &&
          task.dueDate.month == today.month &&
          task.dueDate.day == today.day;
    }).toList();

    final highPriorityTasks =
        tasks.where((task) => task.priority == "High").toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Task Summary", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            TaskSummaryRow(
                tasks: tasks,
                todayTasks: todayTasks,
                highPriorityTasks: highPriorityTasks),
            const SizedBox(height: 20),
            MyButton(
              text: "View My Tasks",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TaskListScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
