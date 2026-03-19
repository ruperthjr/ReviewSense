import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/widgets/glass_container.dart';

class AnalyzingLottieOverlay extends StatelessWidget {
  final bool isLoading;

  const AnalyzingLottieOverlay({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();
    return Stack(
      children: [
        Container(color: Colors.black54),
        Center(
          child: GlassContainer(
            borderRadius: BorderRadius.circular(32),
            blur: 20,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    AssetConstants.analyzingPulse,
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Analyzing Review...',
                    style: AppTypography.syneBold.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}