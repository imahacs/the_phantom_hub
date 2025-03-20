import 'package:flutter/material.dart';
import 'package:the_phantom_fx/core/theme/app_palette.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppPalette.errorColor,
      ),
    );
}
