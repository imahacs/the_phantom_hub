import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';
import 'package:the_phantom_fx/core/usecase/usecase.dart';
import 'package:the_phantom_fx/features/auth/domain/entities/profile.dart';
import 'package:the_phantom_fx/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<Profile, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, Profile>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
      userName: params.userName,
      country: params.country,
      accountType: params.accountType,
    );
  }
}

class UserSignUpParams {
  final String fullName;
  final String email;
  final String password;
  final String userName;
  final String country;
  final String accountType;

  UserSignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userName,
    required this.country,
    required this.accountType,
  });
}
