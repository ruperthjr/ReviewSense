import 'package:flutter/material.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';
import 'package:reviewsense_frontend/shared/widgets/glass_container.dart';
import 'package:reviewsense_frontend/shared/widgets/tilt_3d_wrapper.dart';

class ResultTiltCardWrapper extends StatelessWidget {
  final Widget child;

  const ResultTiltCardWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tilt3DWrapper(
      maxTilt: 3.0, // subtle tilt (~0.05 rad) in degrees
      child: GlassContainer(
        borderRadius: BorderRadius.circular(32),
        blur: 16,
        borderGradient: AppColors.amberGradient,
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    );
  }
}