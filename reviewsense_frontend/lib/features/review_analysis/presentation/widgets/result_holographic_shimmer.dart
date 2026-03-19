import 'package:flutter/material.dart';
import '../../../../shared/widgets/holographic_shimmer_layer.dart';

class ResultHolographicShimmer extends StatelessWidget {
  final bool isActive;

  const ResultHolographicShimmer({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    if (!isActive) return const SizedBox.shrink();
    return const Positioned.fill(
      child: IgnorePointer(
        child: HolographicShimmerLayer(opacity: 0.2),
      ),
    );
  }
}