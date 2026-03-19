import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/history_entry.dart';
import 'history_sentiment_neon_dot.dart';
import '../../../../shared/widgets/glass_container.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class HistoryEntryGlassCard extends StatelessWidget {
  final HistoryEntry entry;
  final VoidCallback onDelete;

  const HistoryEntryGlassCard({
    super.key,
    required this.entry,
    required this.onDelete,
  });

  Color get _sentimentColor {
    switch (entry.sentimentLabel.toLowerCase()) {
      case 'positive':
        return AppColors.greenNeon;
      case 'negative':
        return AppColors.redNeon;
      default:
        return AppColors.amberNeon;
    }
  }

  Color get _authenticityColor {
    switch (entry.authenticityLabel.toLowerCase()) {
      case 'authentic':
        return AppColors.greenNeon;
      case 'mixed':
        return AppColors.amberNeon;
      case 'fake':
        return AppColors.redNeon;
      default:
        return AppColors.amberNeon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swipe right to delete
            onDelete();
          }
        },
        child: GlassContainer(
          borderRadius: BorderRadius.circular(20),
          blur: 10,
          borderGradient: LinearGradient(
            colors: [
              _sentimentColor.withOpacity(0.5),
              Colors.transparent,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_sentimentColor, _authenticityColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.reviewText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.interRegular.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          HistorySentimentNeonDot(
                            color: _sentimentColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            entry.sentimentLabel,
                            style: AppTypography.interMedium.copyWith(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(width: 12),
                          HistorySentimentNeonDot(
                            color: _authenticityColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            entry.authenticityLabel,
                            style: AppTypography.interMedium.copyWith(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  DateFormat('MMM d').format(entry.createdAt),
                  style: AppTypography.interRegular.copyWith(
                    fontSize: 12,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}