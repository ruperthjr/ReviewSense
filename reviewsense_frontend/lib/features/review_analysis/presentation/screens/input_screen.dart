import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/widgets/aurora_background_layer.dart';
import '../providers/analysis_provider.dart';
import '../providers/analysis_state.dart';
import '../widgets/analyze_button.dart';
import '../widgets/analyzing_lottie_overlay.dart';
import '../widgets/review_text_input.dart';

class InputScreen extends ConsumerStatefulWidget {
  const InputScreen({super.key});

  @override
  ConsumerState<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends ConsumerState<InputScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAnalyzePressed() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    ref.read(analysisNotifierProvider.notifier).analyzeReview(text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(analysisNotifierProvider);

    // Use maybeWhen — never reference private generated classes like _Loading.
    final isLoading =
        state.maybeWhen(loading: () => true, orElse: () => false);

    ref.listen<AnalysisState>(analysisNotifierProvider, (_, next) {
      next.maybeWhen(
        success: (_) => context.push('/results'),
        failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        ),
        orElse: () {},
      );
    });

    return Stack(
      children: [
        const AuroraBackgroundLayer(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AssetConstants.logoDark,
                        height: 40,
                      ),
                      IconButton(
                        icon: const Icon(Icons.history, color: Colors.white),
                        onPressed: () => context.push('/history'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ReviewSense',
                    style: AppTypography.syneExtraBold.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Analyze reviews for authenticity and sentiment',
                    style: AppTypography.interRegular.copyWith(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ReviewTextInput(
                    controller: _controller,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 24),
                  AnalyzeButton(
                    onPressed: _onAnalyzePressed,
                    isLoading: isLoading,
                    isEnabled: _controller.text.trim().isNotEmpty,
                  ),
                ],
              ),
            ),
          ),
        ),
        AnalyzingLottieOverlay(isLoading: isLoading),
      ],
    );
  }
}