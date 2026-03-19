import 'package:dartz/dartz.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

import '../entities/history_entry.dart';
import '../repositories/history_repository.dart';

class SaveHistoryEntry {
  final HistoryRepository repository;
  SaveHistoryEntry({required this.repository});

  Future<Either<Failure, void>> call(HistoryEntry entry) {
    return repository.saveEntry(entry);
  }
}