import 'package:flutter/material.dart';
import '../painters/gauge_arc_painter.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class AuthenticityGauge extends StatelessWidget {
  final double score;
  final String label;
  final double width;

  const AuthenticityGauge({
    super.key,
    required this.score,
    required this.label,
    this.width = 200,
  });

  Color get _color {
    switch (label.toLowerCase()) {
      case 'authentic':
        return AppColors.greenNeon;
      case 'mixed':
        return AppColors.amberNeon;
      case 'fake':
        return AppColors.redNeon;
      default:
        return AppColors.amberNeon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          height: width / 2,
          child: CustomPaint(
            painter: GaugeArcPainter(
              score: score,
              color: _color,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTypography.interRegular.copyWith(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}