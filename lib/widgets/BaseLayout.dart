import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final String appBarTitle;

  const BaseLayout({
    required this.child,
    required this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the selected index
        onTap: (index) {
          // Handle navigation
          if (index == 0) {
            // Navigate to the main screen (home)
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            // Navigate to a placeholder screen (e.g., Profile)
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
