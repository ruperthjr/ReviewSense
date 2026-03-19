import 'package:dartz/dartz.dart';
import '../entities/review_request.dart';
import '../entities/analysis_result.dart';
import '../repositories/analysis_repository.dart';
import '../../../../core/error/failure.dart';

class AnalyzeReview {
  final AnalysisRepository repository;

  AnalyzeReview({required this.repository});

  Future<Either<Failure, AnalysisResult>> call(ReviewRequest request) {
    return repository.analyzeReview(request);
  }
}