import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../components/Cards.dart';
import 'FavouriteWidget.dart';
import 'SettingWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    if (index == 0) {
      return const Cards();
    } else if (index == 1) {
      return const FavouriteWidget();
    } else {
      return const SettingWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(
          child: const Text(
            "Planning Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: _getPage(_selectedIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.indigo,
        color: Colors.white,
        animationDuration: const Duration(milliseconds: 200),
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.indigo),
          Icon(Icons.favorite, color: Colors.indigo),
          Icon(Icons.settings, color: Colors.indigo),
        ],
      ),
    );
  }
}
