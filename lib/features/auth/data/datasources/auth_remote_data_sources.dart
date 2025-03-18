import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_phantom_fx/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSources {
  Future<String> signInWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password});
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourcesImpl({required this.supabaseClient});

  @override
  Future<String> signInWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName}, // Country, and account type
      );
      if (response.user == null) {
        throw ServerException('User not created');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
