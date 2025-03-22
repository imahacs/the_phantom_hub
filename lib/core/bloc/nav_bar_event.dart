part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarEvent {}

final class NavBarSwitch extends NavBarEvent {
  final int newIndex;
  NavBarSwitch(this.newIndex);
}