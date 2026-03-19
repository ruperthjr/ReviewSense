import 'package:flutter/material.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class ReviewTextInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? errorText;

  const ReviewTextInput({
    super.key,
    required this.controller,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(16),
      blur: 10,
      borderGradient: AppColors.amberGradient,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: 8,
          minLines: 3,
          style: AppTypography.interRegular.copyWith(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Paste your review here...',
            hintStyle: AppTypography.interRegular.copyWith(
              color: Colors.white60,
            ),
            border: InputBorder.none,
            counterStyle: AppTypography.interRegular.copyWith(
              color: Colors.white38,
            ),
            errorText: errorText,
            errorStyle: AppTypography.interRegular.copyWith(
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}