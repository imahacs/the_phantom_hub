import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:the_phantom_fx/core/theme/app_palette.dart';
import 'package:the_phantom_fx/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_button.dart';
import 'package:the_phantom_fx/features/auth/presentation/widgets/auth_field.dart';
import 'package:the_phantom_fx/main.dart';
import 'package:the_phantom_fx/screens/auth/OTP_screen.dart';
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

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    userName.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _selectedCountry;
  String? _selectedAccountType;

  final List<String> _countries = [
    'USA',
    'Canada',
    'UK',
    'Germany',
    'France',
    'UAE',
    'Saudi Arabia'
  ];

  final List<String> _accountTypes = ['Trader', 'Channel Owner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2<String>(
                //     isExpanded: true,
                //     hint: const Text('Select Account Type',
                //         style: TextStyle(color: Colors.white)),
                //     value: _selectedAccountType,
                //     items: _accountTypes.map((String type) {
                //       return DropdownMenuItem<String>(
                //         value: type,
                //         child: Text(type,
                //             style: const TextStyle(color: Colors.white)),
                //       );
                //     }).toList(),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         _selectedAccountType = newValue;
                //       });
                //     },
                //     buttonStyleData: ButtonStyleData(
                //       padding: const EdgeInsets.symmetric(horizontal: 16),
                //       decoration: BoxDecoration(
                //         color: Colors.grey[900],
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //     dropdownStyleData: DropdownStyleData(
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 16),
                AuthField(
                    label: 'Full Name',
                    hintText: 'Enter your full name',
                    controller: fullNameController),
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
                // const SizedBox(height: 16),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2<String>(
                //     isExpanded: true,
                //     hint: const Text('Select Country',
                //         style: TextStyle(color: Colors.white)),
                //     value: _selectedCountry,
                //     items: _countries.map((String country) {
                //       return DropdownMenuItem<String>(
                //         value: country,
                //         child: Text(country,
                //             style: const TextStyle(color: Colors.white)),
                //       );
                //     }).toList(),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         _selectedCountry = newValue;
                //       });
                //     },
                //     buttonStyleData: ButtonStyleData(
                //       padding: const EdgeInsets.symmetric(horizontal: 16),
                //       decoration: BoxDecoration(
                //         color: Colors.grey[900],
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //     dropdownStyleData: DropdownStyleData(
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20),
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
                                ),
                              );
                      }
                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
