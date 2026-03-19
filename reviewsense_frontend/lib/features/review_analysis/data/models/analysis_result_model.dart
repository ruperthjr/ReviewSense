import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result_model.freezed.dart';
part 'analysis_result_model.g.dart';

@freezed
class AnalysisResultModel with _$AnalysisResultModel {
  const factory AnalysisResultModel({
    required String sentimentLabel,
    required double sentimentScore,
    required double authenticityScore,
    required String authenticityLabel,
    required String summary,
  }) = _AnalysisResultModel;

  factory AnalysisResultModel.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResultModelFromJson(json);
}