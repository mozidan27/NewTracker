import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_provider_model.dart';
import 'package:new_tracker/pages/dashboard_page/widgets/floating_action_button.dart';
import 'package:new_tracker/pages/task_details_page/task_detail_page.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(title: const Text("Task List")),
      body: tasks.isEmpty
          ? const Center(child: Text("No tasks available."))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    title: Text(
                      task.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Due: ${task.dueDate.toLocal()} - Priority: ${task.priority}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: task.isCompleted ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        Provider.of<TaskProvider>(context, listen: false)
                            .toggleTaskCompletion(index);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailScreen(
                            task: task,
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
