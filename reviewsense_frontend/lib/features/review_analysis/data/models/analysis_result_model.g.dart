// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisResultModelImpl _$$AnalysisResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalysisResultModelImpl(
      sentimentLabel: json['sentimentLabel'] as String,
      sentimentScore: (json['sentimentScore'] as num).toDouble(),
      authenticityScore: (json['authenticityScore'] as num).toDouble(),
      authenticityLabel: json['authenticityLabel'] as String,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$AnalysisResultModelImplToJson(
        _$AnalysisResultModelImpl instance) =>
    <String, dynamic>{
      'sentimentLabel': instance.sentimentLabel,
      'sentimentScore': instance.sentimentScore,
      'authenticityScore': instance.authenticityScore,
      'authenticityLabel': instance.authenticityLabel,
      'summary': instance.summary,
    };
