import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_phantom_fx/core/error/exceptions.dart';
import 'package:the_phantom_fx/features/auth/data/models/profile_model.dart';

abstract interface class AuthRemoteDataSources {
  Future<UserModel> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String country,
    required String accountType,
  });
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password}) ;
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourcesImpl({required this.supabaseClient});

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String userName,
    required String country,
    required String accountType,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'username': userName,
          'country': country,
          'account_type': accountType,
        },
      );
      if (response.user == null) {
        throw ServerException('User not created');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('User not created');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
