import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF0A0A0F);
  static const Color glass      = Color(0xFF141428);
  static const Color amber      = Color(0xFFF5A623);
  static const Color white      = Color(0xFFEEEEEE);
  static const Color blue       = Color(0xFF4FC3F7);

  // Neon palette — both naming conventions supported
  static const Color neonGreen  = Color(0xFF81C784);
  static const Color neonRed    = Color(0xFFEF5350);
  static const Color neonAmber  = Color(0xFFF5A623);

  static const Color greenNeon  = neonGreen;
  static const Color redNeon    = neonRed;
  static const Color amberNeon  = neonAmber;

  // Gradients
  static const LinearGradient amberGradient = LinearGradient(
    colors: [Color(0xFFF5A623), Color(0xFFFF6F00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}