import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,

    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
