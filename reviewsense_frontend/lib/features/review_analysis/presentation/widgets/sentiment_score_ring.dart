import 'package:flutter/material.dart';
import '../animations/ring_fill_animation.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class SentimentScoreRing extends StatelessWidget {
  final double score;
  final String label;
  final double size;

  const SentimentScoreRing({
    super.key,
    required this.score,
    required this.label,
    this.size = 180,
  });

  Color get _color {
    switch (label.toLowerCase()) {
      case 'positive':
        return AppColors.greenNeon;
      case 'negative':
        return AppColors.redNeon;
      default:
        return AppColors.amberNeon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: RingFillAnimation(
        targetScore: score,
        color: _color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${(score * 100).toInt()}%',
              style: AppTypography.spaceGroteskBold.copyWith(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.interRegular.copyWith(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}