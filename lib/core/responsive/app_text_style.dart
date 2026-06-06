import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle navbarLogo = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle navbarItem = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle heroTitle = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle heroDescription = TextStyle(
    fontSize: 18,
    height: 1.8,
    color: AppColors.textSecondary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}
