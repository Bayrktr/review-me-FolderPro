import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:DocuSort/app/product/constant/font_family.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(CustomColors.darkBlue.getColor),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomColors.darkBlue.getColor,
    ),
    focusColor: Colors.blue,
  );

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontFamily: FontFamily.roboto,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.roboto,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(CustomColors.darkBlue.getColor),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomColors.darkBlue.getColor,
    ),
    focusColor: Colors.blue,

  );
}
