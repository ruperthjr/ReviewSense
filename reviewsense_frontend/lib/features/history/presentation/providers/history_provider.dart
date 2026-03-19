import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Use package imports — relative '../../../core' from providers/ resolves
// to lib/features/core (wrong). Package imports are always correct.
import 'package:reviewsense_frontend/core/storage/drift/app_database.dart';
import 'package:reviewsense_frontend/core/storage/drift/daos/analysis_history_dao.dart';

import '../../data/datasources/history_local_datasource.dart';
import '../../data/repositories/history_repository_impl.dart';
import '../../domain/entities/history_entry.dart';
import '../../domain/usecases/delete_history_entry.dart';
import '../../domain/usecases/get_history.dart';
import '../../domain/usecases/save_history_entry.dart';
import 'history_state.dart';

part 'history_provider.g.dart';

final analysisHistoryDaoProvider = Provider<AnalysisHistoryDao>((ref) {
  return ref.watch(appDatabaseProvider).analysisHistoryDao;
});

final historyLocalDatasourceProvider = Provider((ref) {
  return HistoryLocalDatasource(dao: ref.watch(analysisHistoryDaoProvider));
});

final historyRepositoryProvider = Provider((ref) {
  return HistoryRepositoryImpl(
    localDatasource: ref.watch(historyLocalDatasourceProvider),
  );
});

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Future<HistoryState> build() => _loadHistory();

  Future<HistoryState> _loadHistory() async {
    final getHistory =
        GetHistory(repository: ref.read(historyRepositoryProvider));
    final result = await getHistory();
    return result.fold(
      (failure) => HistoryState.error(failure.message),
      (entries) => entries.isEmpty
          ? const HistoryState.empty()
          : HistoryState.loaded(entries),
    );
  }

  Future<void> saveEntry(HistoryEntry entry) async {
    final save =
        SaveHistoryEntry(repository: ref.read(historyRepositoryProvider));
    final result = await save(entry);
    result.fold(
      (failure) =>
          state = AsyncValue.data(HistoryState.error(failure.message)),
      (_) => ref.invalidateSelf(),
    );
  }

  Future<void> deleteEntry(int id) async {
    final delete =
        DeleteHistoryEntry(repository: ref.read(historyRepositoryProvider));
    final result = await delete(id);
    result.fold(
      (failure) =>
          state = AsyncValue.data(HistoryState.error(failure.message)),
      (_) => ref.invalidateSelf(),
    );
  }
}