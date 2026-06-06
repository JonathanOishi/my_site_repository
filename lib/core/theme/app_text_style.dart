import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heroTitle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );
}
