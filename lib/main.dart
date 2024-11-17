import 'package:flutter/material.dart';
import 'package:new_tracker/welcome_page.dart';

void main() {
  runApp(const NewTracker());
}

class NewTracker extends StatelessWidget {
  const NewTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
