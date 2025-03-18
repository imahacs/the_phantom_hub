import 'package:the_phantom_fx/core/error/exceptions.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';
import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:the_phantom_fx/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSources remoteDataSources;
  const AuthRepositoryImp(this.remoteDataSources);

  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String country,
    required String accountType,
  }) async {
    try {
      final userId = await remoteDataSources.signUpWithEmailAndPassword(
        fullName: fullName,
        email: email,
        password: password,
        userName: userName,
        country: country,
        accountType: accountType,
      );
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure());
    }
  }
  }