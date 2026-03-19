// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryEntryModelImpl _$$HistoryEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryEntryModelImpl(
      id: (json['id'] as num).toInt(),
      reviewText: json['reviewText'] as String,
      sentimentLabel: json['sentimentLabel'] as String,
      sentimentScore: (json['sentimentScore'] as num).toDouble(),
      authenticityLabel: json['authenticityLabel'] as String,
      authenticityScore: (json['authenticityScore'] as num).toDouble(),
      summary: json['summary'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$HistoryEntryModelImplToJson(
        _$HistoryEntryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewText': instance.reviewText,
      'sentimentLabel': instance.sentimentLabel,
      'sentimentScore': instance.sentimentScore,
      'authenticityLabel': instance.authenticityLabel,
      'authenticityScore': instance.authenticityScore,
      'summary': instance.summary,
      'createdAt': instance.createdAt.toIso8601String(),
    };
