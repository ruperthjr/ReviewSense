import 'package:dartz/dartz.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

import '../../domain/entities/history_entry.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_local_datasource.dart';
import '../models/history_entry_model.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDatasource localDatasource;
  HistoryRepositoryImpl({required this.localDatasource});

  @override
  Future<Either<Failure, void>> saveEntry(HistoryEntry entry) async {
    try {
      final model = HistoryEntryModel(
        id: entry.id,
        reviewText: entry.reviewText,
        sentimentLabel: entry.sentimentLabel,
        sentimentScore: entry.sentimentScore,
        authenticityLabel: entry.authenticityLabel,
        authenticityScore: entry.authenticityScore,
        summary: entry.summary,
        createdAt: entry.createdAt,
      );
      await localDatasource.insertEntry(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HistoryEntry>>> getHistory() async {
    try {
      final models = await localDatasource.getAllEntries();
      final entries = models
          .map((m) => HistoryEntry(
                id: m.id,
                reviewText: m.reviewText,
                sentimentLabel: m.sentimentLabel,
                sentimentScore: m.sentimentScore,
                authenticityLabel: m.authenticityLabel,
                authenticityScore: m.authenticityScore,
                summary: m.summary,
                createdAt: m.createdAt,
              ))
          .toList();
      return Right(entries);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEntry(int id) async {
    try {
      await localDatasource.deleteEntry(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}