import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/interceptors/error_interceptor.dart';
import '../../../../core/network/interceptors/logging_interceptor.dart';
import '../../../history/domain/entities/history_entry.dart';
import '../../../history/presentation/providers/history_provider.dart';
import '../../data/datasources/analysis_remote_datasource.dart';
import '../../data/repositories/analysis_repository_impl.dart';
import '../../domain/entities/review_request.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../../domain/usecases/analyze_review.dart';
import 'analysis_state.dart';

part 'analysis_provider.g.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  dio.interceptors.addAll([LoggingInterceptor(), ErrorInterceptor()]);
  return dio;
});

final analysisRemoteDatasourceProvider = Provider((ref) {
  return AnalysisRemoteDatasource(dio: ref.watch(dioProvider));
});

final analysisRepositoryProvider = Provider<AnalysisRepository>((ref) {
  return AnalysisRepositoryImpl(
    remoteDatasource: ref.watch(analysisRemoteDatasourceProvider),
  );
});

@riverpod
class AnalysisNotifier extends _$AnalysisNotifier {
  @override
  AnalysisState build() => const AnalysisState.initial();

  Future<void> analyzeReview(String reviewText) async {
    state = const AnalysisState.loading();
    final useCase =
        AnalyzeReview(repository: ref.read(analysisRepositoryProvider));
    final result = await useCase(ReviewRequest(reviewText: reviewText));

    result.fold(
      (failure) => state = AnalysisState.failure(failure.message),
      (analysisResult) {
        state = AnalysisState.success(analysisResult);
        ref.read(historyNotifierProvider.notifier).saveEntry(
              HistoryEntry(
                id: Random().nextInt(1 << 31), // Generate a random int id
                reviewText: reviewText,
                // Map AnalysisResult fields → HistoryEntry fields.
                // Adjust the right-hand field names if your AnalysisResult
                // uses different names (e.g. sentiment instead of sentimentLabel).
                sentimentLabel: analysisResult.sentimentLabel,
                sentimentScore: analysisResult.sentimentScore,
                authenticityLabel: analysisResult.authenticityLabel,
                authenticityScore: analysisResult.authenticityScore,
                summary: analysisResult.summary,
                createdAt: DateTime.now(),
              ),
            );
      },
    );
  }
}