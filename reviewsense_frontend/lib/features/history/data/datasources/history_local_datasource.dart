import 'package:reviewsense_frontend/core/storage/drift/daos/analysis_history_dao.dart';
import '../models/history_entry_model.dart';

class HistoryLocalDatasource {
  final AnalysisHistoryDao _dao;

  HistoryLocalDatasource({required AnalysisHistoryDao dao}) : _dao = dao;

  Future<void> insertEntry(HistoryEntryModel entry) async {
    await _dao.insertEntry(entry.toCompanion());
  }

  Future<List<HistoryEntryModel>> getAllEntries() async {
    final rows = await _dao.getAllEntries();
    return rows.map<HistoryEntryModel>(HistoryEntryModel.fromDrift).toList();
  }

  Future<void> deleteEntry(int id) async {
    await _dao.deleteEntry(id);
  }
}