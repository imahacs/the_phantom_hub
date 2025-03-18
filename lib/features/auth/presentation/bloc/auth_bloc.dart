import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_phantom_fx/features/auth/domain/usercase/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(UserSignUpParams(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
        userName: event.userName,
        country: event.country,
        accountType: event.accountType,
      ));

      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (uid) => emit(AuthSuccess(uid)),
      );
    });
  }
}
