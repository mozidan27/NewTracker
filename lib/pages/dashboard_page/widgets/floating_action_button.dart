import 'package:flutter/material.dart';
import 'package:new_tracker/pages/add_edit_task_page/add_or_edit_task_screen.dart';

FloatingActionButton floatingActionButton(BuildContext context) {
  return FloatingActionButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    elevation: 0,
    backgroundColor: Colors.grey[700],
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddEditTaskScreen()),
      );
    },
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}
