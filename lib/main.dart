import 'package:flutter/material.dart';
import 'package:sip_planner/navigation_bar/HomePage.dart';
import 'package:sip_planner/routing/AppRoutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Use the HomePage from the home_page.dart file
      initialRoute: 'HomePage',
      routes: routing,
    );
  }
}