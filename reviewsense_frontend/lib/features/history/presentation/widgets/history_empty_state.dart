import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/theme/typography.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetConstants.emptyHistory,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 16),
          Text(
            'No analyses yet',
            style: AppTypography.syneBold.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your analyzed reviews will appear here',
            style: AppTypography.interRegular.copyWith(
              fontSize: 16,
              color: Colors.white60,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}