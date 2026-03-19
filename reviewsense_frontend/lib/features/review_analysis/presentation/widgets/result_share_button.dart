import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../core/theme/colors.dart';

class ResultShareButton extends StatelessWidget {
  final String shareText;

  const ResultShareButton({super.key, required this.shareText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Share.share(shareText),
      child: GlassContainer(
        borderRadius: BorderRadius.circular(40),
        blur: 10,
        borderGradient: AppColors.amberGradient,
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(
            Icons.share,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}