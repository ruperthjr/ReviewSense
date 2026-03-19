import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/history_provider.dart';
import '../widgets/history_entry_glass_card.dart';
import '../widgets/history_empty_state.dart';
import '../../../../shared/widgets/aurora_background_layer.dart';
import '../../../../shared/widgets/app_back_button.dart';
import '../../../../core/theme/typography.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.watch(historyNotifierProvider);

    return Stack(
      children: [
        const AuroraBackgroundLayer(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: AppBackButton(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'History',
                    style: AppTypography.syneBold.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: historyState.when(
                    data: (state) {
                      return state.maybeWhen(
                        loaded: (entries) {
                          return ListView.builder(
                            itemCount: entries.length,
                            itemBuilder: (context, index) {
                              final entry = entries[index];
                              return TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0.0, end: 1.0),
                                duration: Duration(milliseconds: 400 + index * 100),
                                curve: Curves.easeOut,
                                builder: (context, value, child) {
                                  return Opacity(
                                    opacity: value,
                                    child: Transform.translate(
                                      offset: Offset(0, 20 * (1 - value)),
                                      child: child,
                                    ),
                                  );
                                },
                                child: HistoryEntryGlassCard(
                                  entry: entry,
                                  onDelete: () {
                                    ref
                                        .read(historyNotifierProvider.notifier)
                                        .deleteEntry(entry.id);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        empty: () => const HistoryEmptyState(),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                    error: (error, stack) => Center(
                      child: Text(
                        'Error: $error',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}