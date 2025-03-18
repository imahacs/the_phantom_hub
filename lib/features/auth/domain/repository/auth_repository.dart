import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
  });
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
