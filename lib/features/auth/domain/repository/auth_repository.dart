import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';
import 'package:the_phantom_fx/features/auth/domain/entities/profile.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Profile>> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String country,
    required String accountType,
  });
  Future<Either<Failure, Profile>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
