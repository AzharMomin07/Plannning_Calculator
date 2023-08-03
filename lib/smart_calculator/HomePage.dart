import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sip_planner/components/Cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        title: const Text(
          "Planning Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Cards(), // Replace the Text widget with CardGrid widget
      ),
      backgroundColor: Colors.indigo,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.indigo,
        color: Colors.white,
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(Icons.home, color: Colors.indigo),
          Icon(Icons.favorite, color: Colors.indigo),
          Icon(Icons.settings, color: Colors.indigo),
        ],
      ),
    );
  }
}