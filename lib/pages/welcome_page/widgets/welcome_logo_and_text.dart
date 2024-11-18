import 'package:flutter/material.dart';
import 'package:new_tracker/pages/dashboard_page/dashboard_page.dart';
import 'package:new_tracker/pages/welcome_page/widgets/my_button.dart';

class WelcomeLogoAndText extends StatelessWidget {
  const WelcomeLogoAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // logo
        Icon(
          Icons.dashboard_customize_outlined,
          size: 60,
          color: Colors.grey[700],
        ),
        const SizedBox(
          height: 16,
        ),
        // welcome message
        Text(
          "Welcome Back!, Are you ready to create new task?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Let's start and create your today's tasks",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //button to navigate to dashboard
        MyButton(
          text: 'Hit For Dashboard',
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ));
          },
        )
      ],
    );
  }
}
