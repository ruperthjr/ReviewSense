import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';

// Companions and Data classes live in app_database.g.dart (via the part directive
// in app_database.dart). There is no analysis_history_table.g.dart.
import 'package:reviewsense_frontend/core/storage/drift/app_database.dart';

part 'history_entry_model.freezed.dart';
part 'history_entry_model.g.dart';

@freezed
class HistoryEntryModel with _$HistoryEntryModel {
  const HistoryEntryModel._();

  const factory HistoryEntryModel({
    required int id,
    required String reviewText,
    required String sentimentLabel,
    required double sentimentScore,
    required String authenticityLabel,
    required double authenticityScore,
    required String summary,
    required DateTime createdAt,
  }) = _HistoryEntryModel;

  factory HistoryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryModelFromJson(json);

  /// Convert to a Drift companion for inserting.
  /// When id == 0 it is a new record — omit id so autoIncrement takes over.
  AnalysisHistoryTableCompanion toCompanion() {
    return AnalysisHistoryTableCompanion(
      id: id == 0 ? const drift.Value.absent() : drift.Value(id),
      reviewText: drift.Value(reviewText),
      sentimentLabel: drift.Value(sentimentLabel),
      sentimentScore: drift.Value(sentimentScore),
      authenticityLabel: drift.Value(authenticityLabel),
      authenticityScore: drift.Value(authenticityScore),
      summary: drift.Value(summary),
      createdAt: drift.Value(createdAt),
    );
  }

  /// Create from a Drift-generated data row.
  /// Drift names the row class <TableClassName>Data, e.g. AnalysisHistoryTableData.
  factory HistoryEntryModel.fromDrift(AnalysisHistoryTableData row) {
    return HistoryEntryModel(
      id: row.id,
      reviewText: row.reviewText,
      sentimentLabel: row.sentimentLabel,
      sentimentScore: row.sentimentScore,
      authenticityLabel: row.authenticityLabel,
      authenticityScore: row.authenticityScore,
      summary: row.summary,
      createdAt: row.createdAt,
    );
  }
}