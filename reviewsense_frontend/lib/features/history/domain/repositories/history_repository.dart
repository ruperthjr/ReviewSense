import 'package:dartz/dartz.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

import '../entities/history_entry.dart';

abstract class HistoryRepository {
  Future<Either<Failure, void>> saveEntry(HistoryEntry entry);
  Future<Either<Failure, List<HistoryEntry>>> getHistory();
  Future<Either<Failure, void>> deleteEntry(int id);
}