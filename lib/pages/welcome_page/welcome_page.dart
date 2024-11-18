import 'package:flutter/material.dart';
import 'package:new_tracker/pages/welcome_page/widgets/welcome_logo_and_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            right: 8.0,
            left: 8,
          ),
          child: WelcomeLogoAndText(),
        ),
      ),
    );
  }
}
