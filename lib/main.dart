import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_phantom_fx/core/theme/theme.dart';
import 'package:the_phantom_fx/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_phantom_fx/features/auth/presentation/screens/login_screen.dart';
import 'package:the_phantom_fx/init_dependencies.dart';
import 'package:the_phantom_fx/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
 
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
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
      home: const NavBar(),
    );
  }
}
