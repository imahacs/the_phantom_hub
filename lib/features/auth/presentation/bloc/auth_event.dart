part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String fullName;
  final String email;
  final String password;
  final String userName;
  final String country;
  final String accountType;

  AuthSignUp({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userName,
    required this.country,
    required this.accountType,
  });
}

