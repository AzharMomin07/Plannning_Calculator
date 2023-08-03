import 'package:flutter/material.dart';
import 'package:sip_planner/routing/AppRoutes.dart';
import 'package:sip_planner/smart_calculator/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: 'HomePage',
      routes: routing,
    );
  }
}
