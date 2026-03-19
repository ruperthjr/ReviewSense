import 'package:reviewsense_frontend/core/storage/drift/app_database.dart';
import 'package:drift/drift.dart' as drift;

class LocalStorageService {
  final AppDatabase _database;

  LocalStorageService(this._database);

  Future<int?> insertHistoryEntry({
    required String reviewText,
    required String sentimentLabel,
    required double sentimentScore,
    required double authenticityScore,
    required String authenticityLabel,
    required String summary,
  }) async {
    try {
      final dao = _database.analysisHistoryDao;
      final id = await dao.insertEntry(
        AnalysisHistoryTableCompanion(
          reviewText: drift.Value(reviewText),
          sentimentLabel: drift.Value(sentimentLabel),
          sentimentScore: drift.Value(sentimentScore),
          authenticityScore: drift.Value(authenticityScore),
          authenticityLabel: drift.Value(authenticityLabel),
          summary: drift.Value(summary),
        ),
      );
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<List<AnalysisHistoryTableData>> getAllHistory() async {
    try {
      final dao = _database.analysisHistoryDao;
      return await dao.getAllEntries();
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteHistoryEntry(int id) async {
    try {
      final dao = _database.analysisHistoryDao;
      await dao.deleteEntry(id);
      return true;
    } catch (e) {
      return false;
    }
  }
}