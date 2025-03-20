import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_phantom_fx/core/secrets/app_supabase.dart';
import 'package:the_phantom_fx/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:the_phantom_fx/features/auth/data/repository/auth_repository_imp.dart';
import 'package:the_phantom_fx/features/auth/domain/repository/auth_repository.dart';
import 'package:the_phantom_fx/features/auth/domain/usercase/user_sign_up.dart';
import 'package:the_phantom_fx/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSupabase.url,
    anonKey: AppSupabase.anonKey,
    debug: true,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSources>(
    () => AuthRemoteDataSourcesImpl(
      supabaseClient: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}
