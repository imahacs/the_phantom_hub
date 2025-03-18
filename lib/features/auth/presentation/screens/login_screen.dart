import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_phantom_fx/core/theme/app_palette.dart';
import 'package:the_phantom_fx/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_button.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_field.dart';
import 'package:the_phantom_fx/nav_bar.dart';

class LoginScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
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
                    label: 'Email',
                    hintText: 'Enter your email',
                    controller: emailController),
                const SizedBox(height: 16),
                AuthField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isObscureText: true),
                // const SizedBox(height: 16),
                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: AuthButton(
                    buttonText: 'Login',
                    onPressed: () {},
                    // onPressed: () {
                    //   if (_selectedAccountType == null) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //         content: Text('Please select an account type.'),
                    //         backgroundColor: Colors.red,
                    //       ),
                    //     );
                    //     return;
                    //   }

                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const OtpScreen()),
                    //   );
                    // },
                  ),
                  // child: ElevatedButton(
                  //   onPressed: () {
                  //     if (_selectedAccountType == null) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text("Please select an account type."),
                  //           backgroundColor: Colors.red,
                  //         ),
                  //       );
                  //       return;
                  //     }

                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const OtpScreen()),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     foregroundColor: Colors.black,
                  //     padding: const EdgeInsets.symmetric(vertical: 12),
                  //   ),
                  //   child: const Text('Sign Up'),
                  // ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SignUpScreen.route(),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppPalette.secondaryColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
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
          ),
        ),
      ),
    );
  }
}
