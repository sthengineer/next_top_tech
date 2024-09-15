import 'package:flutter/material.dart';
import 'package:next_top_tech/core/res/colors.dart';
import 'package:next_top_tech/core/res/fonts.dart';

class AppTheme {
  AppTheme();

  ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.greenDark,
        onPrimary: AppColors.greenishTeal,
        secondary: AppColors.logoOrange,
        onSecondary: AppColors.alabaster,
        error: AppColors.redCardinal,
        onError: AppColors.redCardinal,
        surface: AppColors.greyCharcoal,
        onSurface: AppColors.greyCharcoal,
      ),
      fontFamily: Fonts.english,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.alabaster,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.greyCharcoal,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.greyCharcoal,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      brightness: Brightness.light,
      iconTheme: const IconThemeData(
        color: AppColors.greyCharcoal,
      ),
      cardColor: AppColors.white,
      dividerColor: AppColors.greyDawn,
      primaryColor: AppColors.greenDark,
      primarySwatch: AppColors.greenDarkMaterial,
      scaffoldBackgroundColor: AppColors.alabaster,
      textTheme: _textTheme(color: AppColors.greyCharcoal),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackOnyx,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      fontFamily: Fonts.english,
      cardColor: AppColors.greyNero,
      dividerColor: AppColors.greyCharcoal,
      primaryColor: AppColors.greenDark,
      primarySwatch: AppColors.greenDarkMaterial,
      scaffoldBackgroundColor: AppColors.blackOnyx,
      textTheme: _textTheme(color: AppColors.white),
    );
  }

  static TextTheme _textTheme({required Color color}) {
    return const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ).apply(
      bodyColor: color,
      displayColor: color,
    );
  }
}
