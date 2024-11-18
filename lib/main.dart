import 'package:flutter/material.dart';
import 'package:new_tracker/models/task_provider_model.dart';
import 'package:new_tracker/pages/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const NewTracker(),
    ),
  );
}

class NewTracker extends StatelessWidget {
  const NewTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}
