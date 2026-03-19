import 'package:dartz/dartz.dart';
import '../entities/review_request.dart';
import '../entities/analysis_result.dart';
import '../../../../core/error/failure.dart';

abstract class AnalysisRepository {
  Future<Either<Failure, AnalysisResult>> analyzeReview(ReviewRequest request);
}