import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reviewsense_frontend/core/theme/colors.dart';
import 'package:reviewsense_frontend/shared/widgets/glass_container.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: GestureDetector(
        onTap: onPressed ?? () => context.pop(),
        child: GlassContainer(
          width: 48,
          height: 48,
          borderRadius: BorderRadius.circular(24),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.amber,
            size: 20,
          ),
        ),
      ),
    );
  }
}