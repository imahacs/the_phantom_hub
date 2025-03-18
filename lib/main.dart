import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_phantom_fx/core/secrets/app_supabase.dart';
import 'package:the_phantom_fx/core/theme/theme.dart';
import 'package:the_phantom_fx/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:the_phantom_fx/features/auth/data/repository/auth_repository_imp.dart';
import 'package:the_phantom_fx/features/auth/domain/usercase/user_sign_up.dart';
import 'package:the_phantom_fx/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_phantom_fx/features/auth/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSupabase.url,
    anonKey: AppSupabase.anonKey,
    debug: true,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImp(
              AuthRemoteDataSourcesImpl(supabaseClient: supabase.client),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Phantom Hub',
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
