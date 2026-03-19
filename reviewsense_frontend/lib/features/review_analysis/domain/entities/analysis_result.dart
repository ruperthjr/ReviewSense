import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result.freezed.dart';

@freezed
class AnalysisResult with _$AnalysisResult {
  const factory AnalysisResult({
    required String sentimentLabel,
    required double sentimentScore,
    required double authenticityScore,
    required String authenticityLabel,
    required String summary,
  }) = _AnalysisResult;
}