import 'package:flutter/material.dart';
import '../../../../shared/widgets/neon_glow_wrapper.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class AnalyzeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;

  const AnalyzeButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveEnabled = isEnabled && !isLoading;

    return NeonGlowWrapper(
      color: AppColors.amber,
      blurRadius: 20,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: effectiveEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.amber.withOpacity(0.3);
              }
              return Colors.transparent;
            }),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  'Analyze Review',
                  style: AppTypography.syneBold.copyWith(
                    fontSize: 18,
                    color: effectiveEnabled ? Colors.white : Colors.white54,
                  ),
                ),
        ),
      ),
    );
  }
}