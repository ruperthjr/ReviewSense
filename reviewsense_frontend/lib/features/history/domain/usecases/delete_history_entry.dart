import 'package:dartz/dartz.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

import '../repositories/history_repository.dart';

class DeleteHistoryEntry {
  final HistoryRepository repository;
  DeleteHistoryEntry({required this.repository});

  Future<Either<Failure, void>> call(int id) {
    return repository.deleteEntry(id);
  }
}