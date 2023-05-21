import 'package:flutter/material.dart';
import 'package:cinema_app/view/main/explore_screen.dart';
import 'package:cinema_app/view/main/home_screen.dart';
// import 'package:cinema_app/view/main/my_ticket_screen.dart';
// import 'package:cinema_app/view/main/profile_screen.dart';
import 'package:cinema_app/view/main/nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ExplorePage(),
    // MyTicketScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C28),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
