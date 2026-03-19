import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';

class HolographicShimmerPainter extends CustomPainter {
  final double offset; // 0 to 1, controls shift

  HolographicShimmerPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final gradient = LinearGradient(
      begin: Alignment(-1.0 + offset * 2, -1.0),
      end: Alignment(1.0 + offset * 2, 1.0),
      colors: const [
        Colors.transparent,
        AppColors.amber,
        Colors.cyan,
        Colors.pink,
        AppColors.amber,
        Colors.transparent,
      ],
      stops: const [0.0, 0.3, 0.5, 0.7, 0.9, 1.0],
    ).createShader(rect);

    final paint = Paint()
      ..shader = gradient
      ..blendMode = BlendMode.softLight;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(HolographicShimmerPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}