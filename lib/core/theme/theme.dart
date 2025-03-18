import 'package:flutter/material.dart';
import 'package:the_phantom_fx/core/theme/app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.tertiaryColor]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color),
      );
  static ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'GoogleFonts.abrilFatface',
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          // labelStyle: const TextStyle(color: Colors.red, fontSize: 16),
          hintStyle:
              const TextStyle(color: AppPalette.secondaryColor, fontSize: 14),
          enabledBorder: _border(AppPalette.quaternaryColor),
          focusedBorder: _border(Colors.white),
          errorBorder: _border(Colors.red),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
}
