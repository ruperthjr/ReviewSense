import 'package:dartz/dartz.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

import '../entities/history_entry.dart';
import '../repositories/history_repository.dart';

class GetHistory {
  final HistoryRepository repository;
  GetHistory({required this.repository});

  Future<Either<Failure, List<HistoryEntry>>> call() {
    return repository.getHistory();
  }
}