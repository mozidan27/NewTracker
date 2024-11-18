import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_model.dart';
import 'package:new_tracker/pages/add_edit_task_page/add_or_edit_task_screen.dart';
import 'package:new_tracker/pages/welcome_page/widgets/my_button.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final int index;

  const TaskDetailScreen({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: ${task.title}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Description: ${task.description}"),
            const SizedBox(height: 10),
            Text("Due Date: ${task.dueDate.toLocal()}"),
            const SizedBox(height: 10),
            Text("Priority: ${task.priority}"),
            const SizedBox(height: 20),
            MyButton(
              text: "Back",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            MyButton(
              text: "Edit Your Task",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditTaskScreen(
                      task: task,
                      index: index,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
