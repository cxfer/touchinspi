import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/main_landing_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanjohi Ndungu | TouchInspiration Interview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainLandingPage(),
    );
  }
}
