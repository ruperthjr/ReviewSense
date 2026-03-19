import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';
import 'package:reviewsense_frontend/core/theme/typography.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.amber,
          secondary: AppColors.blue,
          surface: AppColors.glass,
          background: AppColors.background,
          error: AppColors.neonRed,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.white,
          onBackground: AppColors.white,
          onError: AppColors.white,
        ),
        textTheme: AppTypography.textTheme,
        // No AppBarTheme intentionally
        useMaterial3: true,
      );
}