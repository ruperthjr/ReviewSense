import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';

class AuroraMeshPainter extends CustomPainter {
  final double animationValue;

  AuroraMeshPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(AppColors.background, BlendMode.src);

    _drawBlob(
      canvas: canvas,
      center: Offset(
        size.width * (0.5 + 0.2 * sin(animationValue * 2 * pi)),
        size.height * (0.5 + 0.2 * cos(animationValue * 1.3 * pi)),
      ),
      radius: size.width * 0.6,
      color: AppColors.amber.withOpacity(0.15),
    );

    _drawBlob(
      canvas: canvas,
      center: Offset(
        size.width * (0.3 + 0.15 * cos(animationValue * 1.7 * pi)),
        size.height * (0.7 + 0.1 * sin(animationValue * 2.1 * pi)),
      ),
      radius: size.width * 0.5,
      color: AppColors.blue.withOpacity(0.12),
    );

    _drawBlob(
      canvas: canvas,
      center: Offset(
        size.width * (0.7 + 0.1 * sin(animationValue * 2.4 * pi)),
        size.height * (0.2 + 0.15 * cos(animationValue * 1.5 * pi)),
      ),
      radius: size.width * 0.4,
      color: AppColors.neonGreen.withOpacity(0.1),
    );
  }

  void _drawBlob({
    required Canvas canvas,
    required Offset center,
    required double radius,
    required Color color,
  }) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final shader = RadialGradient(
      // 'center' is Alignment within the rect — Alignment.center is correct here.
      center: Alignment.center,
      colors: [color, Colors.transparent],
    ).createShader(rect);
    canvas.drawCircle(center, radius, Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(AuroraMeshPainter old) =>
      old.animationValue != animationValue;
}