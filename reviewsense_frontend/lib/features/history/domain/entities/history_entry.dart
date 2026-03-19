import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entry.freezed.dart';

@freezed
class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    // 0 means "not yet persisted" — DAO will use autoIncrement.
    @Default(0) required int id,
    required String reviewText,
    required String sentimentLabel,
    required double sentimentScore,
    required String authenticityLabel,
    required double authenticityScore,
    required String summary,
    required DateTime createdAt,
  }) = _HistoryEntry;
}
