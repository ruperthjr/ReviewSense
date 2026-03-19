import 'package:flutter/material.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../shared/widgets/holographic_shimmer_layer.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class SummaryGlassCard extends StatelessWidget {
  final String summary;

  const SummaryGlassCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlassContainer(
          borderRadius: BorderRadius.circular(24),
          blur: 12,
          borderGradient: AppColors.amberGradient,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Summary',
                  style: AppTypography.syneSemiBold.copyWith(
                    fontSize: 18,
                    color: AppColors.amber,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  summary,
                  style: AppTypography.interRegular.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const HolographicShimmerLayer(opacity: 0.3),
      ],
    );
  }
}