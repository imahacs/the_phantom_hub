import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'screens/home_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/forum_screen.dart';
import 'screens/news_screen.dart';
import 'screens/signals_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SignalsScreen(),
    NewsScreen(),
    const CoursesScreen(),
    const ForumScreen(),
    // const CalculatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.white,
            iconSize: 26,
            padding: const EdgeInsets.all(8),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: Colors.grey[800]!,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.bar_chart, text: 'Signals'),
              GButton(icon: Icons.newspaper, text: 'News'),
              GButton(icon: Icons.menu_book, text: 'Courses'),
              GButton(icon: Icons.forum, text: 'Channels'),
              // GButton(icon: Icons.calculate, text: 'Calculator'), 
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
