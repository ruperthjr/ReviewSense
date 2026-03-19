import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/aurora_background_layer.dart';
import '../../../../shared/widgets/app_back_button.dart';
import '../../../../core/theme/typography.dart';
import '../providers/analysis_provider.dart';
import '../widgets/sentiment_score_ring.dart';
import '../widgets/authenticity_gauge.dart';
import '../widgets/summary_glass_card.dart';
import '../widgets/score_label_chip.dart';
import '../widgets/result_tilt_card_wrapper.dart';
import '../widgets/result_holographic_shimmer.dart';
import '../widgets/result_share_button.dart';
import '../animations/result_entrance_animation.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisNotifierProvider);
    return state.maybeWhen(
      success: (result) {
        final shareText = '''
Review Analysis:
Sentiment: ${result.sentimentLabel} (${(result.sentimentScore * 100).toInt()}%)
Authenticity: ${result.authenticityLabel} (${(result.authenticityScore * 100).toInt()}%)
Summary: ${result.summary}
''';
        return Stack(
          children: [
            const AuroraBackgroundLayer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    const SizedBox(height: 20),
                    Text(
                      'Analysis Result',
                      style: AppTypography.syneBold.copyWith(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ResultEntranceAnimation(
                        child: ResultTiltCardWrapper(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SentimentScoreRing(
                                    score: result.sentimentScore,
                                    label: result.sentimentLabel,
                                  ),
                                  AuthenticityGauge(
                                    score: result.authenticityScore,
                                    label: result.authenticityLabel,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SummaryGlassCard(summary: result.summary),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ScoreLabelChip(
                                    label: result.sentimentLabel,
                                    color: _getColorForSentiment(
                                      result.sentimentLabel,
                                    ),
                                  ),
                                  ScoreLabelChip(
                                    label: result.authenticityLabel,
                                    color: _getColorForAuthenticity(
                                      result.authenticityLabel,
                                    ),
                                  ),
                                  ResultShareButton(shareText: shareText),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResultHolographicShimmer(isActive: true),
          ],
        );
      },
      orElse: () => const Center(
        child: Text('No result', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Color _getColorForSentiment(String label) {
    switch (label.toLowerCase()) {
      case 'positive':
        return const Color(0xFF00FFAA);
      case 'negative':
        return const Color(0xFFFF3B3B);
      default:
        return const Color(0xFFFFD700);
    }
  }

  Color _getColorForAuthenticity(String label) {
    switch (label.toLowerCase()) {
      case 'authentic':
        return const Color(0xFF00FFAA);
      case 'mixed':
        return const Color(0xFFFFD700);
      case 'fake':
        return const Color(0xFFFF3B3B);
      default:
        return const Color(0xFFFFD700);
    }
  }
}