import 'package:drift/drift.dart';
import 'package:reviewsense_frontend/core/storage/drift/app_database.dart';
import 'package:reviewsense_frontend/core/storage/drift/tables/analysis_history_table.dart';

part 'analysis_history_dao.g.dart';

@DriftAccessor(tables: [AnalysisHistoryTable])
class AnalysisHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$AnalysisHistoryDaoMixin {
  AnalysisHistoryDao(super.db);

  // Accepts a companion so callers don't need to destructure fields.
  Future<int> insertEntry(AnalysisHistoryTableCompanion companion) {
    return into(analysisHistoryTable).insert(companion);
  }

  Future<List<AnalysisHistoryTableData>> getAllEntries() {
    return (select(analysisHistoryTable)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<int> deleteEntry(int id) {
    return (delete(analysisHistoryTable)..where((t) => t.id.equals(id))).go();
  }
}