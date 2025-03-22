import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_phantom_fx/screens/courses_screen.dart';
import 'package:the_phantom_fx/screens/forum_screen.dart';
import 'package:the_phantom_fx/screens/home_screen.dart';
import 'package:the_phantom_fx/screens/news_screen.dart';
import 'package:the_phantom_fx/screens/signals_screen.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const SignalsScreen(),
    NewsScreen(),
    const CoursesScreen(),
    const ForumScreen(),
    // const CalculatorScreen(),
  ];
  NavBarBloc() : super(NavBarInitial()) {
    on<NavBarSwitch>((event, emit) {
      selectedIndex = event.newIndex;
      emit(SwitchNavState());
    });
  }
}
