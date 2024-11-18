import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_model.dart';
import 'package:new_tracker/pages/add_edit_task_page/widgets/add_or_save_button.dart';
import 'package:new_tracker/pages/welcome_page/widgets/my_button.dart';
import 'package:new_tracker/widgets/my_text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AddEditTaskScreen extends StatefulWidget {
  final Task? task;
  final int? index;

  const AddEditTaskScreen({super.key, this.task, this.index});

  @override
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;
  String _priority = "Normal";

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _dueDate = widget.task!.dueDate;
      _priority = widget.task!.priority;
    }
  }

  Future<void> _pickDueDateTime() async {
    // Pick date first
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Then pick time
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_dueDate ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          _dueDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Add Task" : "Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFormField(
                text: "Task Title",
                obscureText: false,
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              MyTextFormField(
                text: "Description",
                obscureText: false,
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                _dueDate == null
                    ? "No Due Date Selected"
                    : "Due: ${DateFormat('yyyy-MM-dd HH:mm').format(_dueDate!)}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                text: "Pick Your Date",
                onTap: _pickDueDateTime,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _priority,
                items: ["High", "Normal", "Low"].map((priority) {
                  return DropdownMenuItem<String>(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
                decoration: const InputDecoration(labelText: "Priority"),
              ),
              const SizedBox(height: 16),
              AddOrSaveButton(
                  widget: widget,
                  formKey: _formKey,
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  dueDate: _dueDate,
                  priority: _priority),
            ],
          ),
        ),
      ),
    );
  }
}
