import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';
import 'package:the_phantom_fx/core/usecase/usecase.dart';
import 'package:the_phantom_fx/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
      userName: params.userName,
    );
  }
}

class UserSignUpParams {
  final String fullName;
  final String email;
  final String password;
  final String userName;

  UserSignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userName,
  });
}
