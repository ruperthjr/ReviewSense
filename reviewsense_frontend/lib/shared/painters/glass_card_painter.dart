import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';

class GlassCardPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final bool animateBorder;
  final double animationValue; // To be provided by parent if animating

  GlassCardPainter({
    required this.borderRadius,
    this.animateBorder = false,
    this.animationValue = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = borderRadius.toRRect(rect);

    // Background fill (glass effect is applied via BackdropFilter in widget)
    final backgroundPaint = Paint()..color = Colors.transparent;
    canvas.drawRRect(rrect, backgroundPaint);

    // Gradient overlay
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.white.withOpacity(0.08),
          AppColors.white.withOpacity(0.03),
        ],
      ).createShader(rect);
    canvas.drawRRect(rrect, gradientPaint);

    // Border
    if (animateBorder) {
      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..shader = SweepGradient(
          startAngle: animationValue * 2 * 3.14159,
          endAngle: animationValue * 2 * 3.14159 + 2 * 3.14159,
          colors: [AppColors.amber, AppColors.blue, AppColors.amber],
        ).createShader(rect);
      canvas.drawRRect(rrect, borderPaint);
    } else {
      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = AppColors.white.withOpacity(0.1);
      canvas.drawRRect(rrect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(GlassCardPainter oldDelegate) {
    return oldDelegate.animateBorder != animateBorder ||
        oldDelegate.animationValue != animationValue;
  }
}