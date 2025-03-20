import 'package:the_phantom_fx/core/error/exceptions.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';
import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:the_phantom_fx/features/auth/domain/entities/profile.dart';
import 'package:the_phantom_fx/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSources remoteDataSources;
  const AuthRepositoryImp(this.remoteDataSources);

  @override
  Future<Either<Failure, Profile>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSources.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String country,
    required String accountType,
  }) async {
    try {
      final user = await remoteDataSources.signUpWithEmailAndPassword(
        fullName: fullName,
        email: email,
        password: password,
        userName: userName,
        country: country,
        accountType: accountType,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure());
    }
  }
  // Future<Either<Failure, Profile>> _getUser()async{
  //   return Right(Profile(
  //     id: '1',
  //     username: 'username',
  //     fullName: 'fullName',
  //     country: 'country',
  //     accountType: 'accountType',
  //     email: 'email',
  //   ));

  // }
}