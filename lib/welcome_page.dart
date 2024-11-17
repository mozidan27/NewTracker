import 'package:flutter/material.dart';
import 'package:new_tracker/dashboard_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            left: 8,
          ),
          child: Column(
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const DashboardPage();
                    },
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(16)),
                  child: const Text(
                    "Hit For Dashborad Screen ➢",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
