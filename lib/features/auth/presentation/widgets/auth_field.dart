import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const AuthField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return '$hintText cannot be empty';
            }
            return null;
          },
          obscureText: isObscureText,
          obscuringCharacter: String.fromCharCode(0x2022),
        ),
      ],
    );
  }
}
