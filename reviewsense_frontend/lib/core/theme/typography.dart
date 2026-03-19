import 'package:flutter/material.dart';

class AppTypography {
  // Static TextStyle getters used across the app
  static const TextStyle syneBold = TextStyle(
    fontFamily: 'Syne',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle syneSemiBold = TextStyle(
    fontFamily: 'Syne',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle syneRegular = TextStyle(
    fontFamily: 'Syne',
    fontWeight: FontWeight.w400,
  );

  // syneExtraBold falls back to bold since we only ship up to 700
  static const TextStyle syneExtraBold = TextStyle(
    fontFamily: 'Syne',
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );

  static const TextStyle interRegular = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle interMedium = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle interSemiBold = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  // No Space Grotesk font bundled — fallback to Syne bold
  static const TextStyle spaceGroteskBold = TextStyle(
    fontFamily: 'Syne',
    fontWeight: FontWeight.w700,
  );

  // TextTheme for MaterialApp
  static TextTheme get textTheme {
    return TextTheme(
      displayLarge:  syneBold.copyWith(fontSize: 57),
      displayMedium: syneBold.copyWith(fontSize: 45),
      displaySmall:  syneBold.copyWith(fontSize: 36),
      headlineLarge: syneSemiBold.copyWith(fontSize: 32),
      headlineMedium: syneSemiBold.copyWith(fontSize: 28),
      headlineSmall: syneSemiBold.copyWith(fontSize: 24),
      titleLarge:   interSemiBold.copyWith(fontSize: 22),
      titleMedium:  interSemiBold.copyWith(fontSize: 16),
      titleSmall:   interSemiBold.copyWith(fontSize: 14),
      bodyLarge:    interRegular.copyWith(fontSize: 16),
      bodyMedium:   interRegular.copyWith(fontSize: 14),
      bodySmall:    interRegular.copyWith(fontSize: 12),
      labelLarge:   interMedium.copyWith(fontSize: 14),
      labelMedium:  interMedium.copyWith(fontSize: 12),
      labelSmall:   interMedium.copyWith(fontSize: 11),
    );
  }
}