import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:the_phantom_fx/core/bloc/nav_bar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarBloc(),
      child: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state) {
          final bloc = context.read<NavBarBloc>();
          return Scaffold(
                backgroundColor: Colors.black,
                body: bloc.screens[bloc.selectedIndex],
                bottomNavigationBar: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GNav(
                      gap: 8,
                      activeColor: Colors.white,
                      color: Colors.white,
                      iconSize: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      selectedIndex: bloc.selectedIndex,
                      onTabChange: (index) => bloc.add(NavBarSwitch(index)),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
