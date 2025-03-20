import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_phantom_fx/core/common/widgets/loader.dart';
import 'package:the_phantom_fx/core/theme/app_palette.dart';
import 'package:the_phantom_fx/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_button.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_dropdown.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_field.dart';
import 'package:the_phantom_fx/utils/show_snackbar.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignUpScreen());
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedCountry;
  String? selectedAccountType;

  final List<String> countries = ['USA', 'UK', 'UAE', 'Saudi Arabia'];
  final List<String> accountTypes = ['Trader', 'Channel Owner'];

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    userName.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Loader();
              }
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 80),
                    Text(
                      'THE PHANTOM HUB',
                      style: GoogleFonts.abrilFatface(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    AuthField(
                        label: 'Full Name',
                        hintText: 'Enter your full name',
                        controller: fullNameController),
                    const SizedBox(height: 16),
                    AuthDropdown(
                      label: "Country",
                      hintText: "Select Country",
                      value: selectedCountry,
                      items: countries,
                      onChanged: (value) =>
                          setState(() => selectedCountry = value),
                    ),
                    const SizedBox(height: 16),
                    AuthDropdown(
                      label: "Account Type",
                      hintText: "Select Account Type",
                      value: selectedAccountType,
                      items: ["Trader", "Channel Owner"],
                      onChanged: (value) =>
                          setState(() => selectedAccountType = value),
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                        label: 'Username',
                        hintText: 'Enter your username',
                        controller: userName),
                    const SizedBox(height: 16),
                    AuthField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        controller: emailController),
                    const SizedBox(height: 16),
                    AuthField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        controller: passwordController,
                        isObscureText: true),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: AuthButton(
                        buttonText: 'Sign Up',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    fullName: fullNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    userName: userName.text.trim(),
                                    country: selectedCountry!,
                                    accountType: selectedAccountType!,
                                  ),
                                );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppPalette.secondaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
