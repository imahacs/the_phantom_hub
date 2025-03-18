import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password});
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password});
}
