import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_model.dart';
import 'package:new_tracker/models/task_provider_model.dart';
import 'package:new_tracker/pages/add_edit_task_page/add_or_edit_task_screen.dart';
import 'package:new_tracker/pages/welcome_page/widgets/my_button.dart';
import 'package:provider/provider.dart';

class AddOrSaveButton extends StatelessWidget {
  const AddOrSaveButton({
    super.key,
    required this.widget,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required DateTime? dueDate,
    required String priority,
  })  : _formKey = formKey,
        _titleController = titleController,
        _descriptionController = descriptionController,
        _dueDate = dueDate,
        _priority = priority;

  final AddEditTaskScreen widget;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final DateTime? _dueDate;
  final String _priority;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      text: widget.task == null ? "Add Task" : "Save Changes",
      onTap: () {
        if (_formKey.currentState!.validate()) {
          final newTask = Task(
            title: _titleController.text,
            description: _descriptionController.text,
            dueDate: _dueDate ?? DateTime.now(),
            priority: _priority,
            isCompleted: widget.task?.isCompleted ?? false,
          );

          if (widget.task == null) {
            Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
          } else {
            Provider.of<TaskProvider>(context, listen: false)
                .updateTask(widget.index!, newTask);
          }

          Navigator.pop(context);
        }
      },
    );
  }
}
