import 'package:dartz/dartz.dart';
import '../../domain/entities/review_request.dart';
import '../../domain/entities/analysis_result.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../datasources/analysis_remote_datasource.dart';
import '../models/review_request_model.dart';
import '../../../../core/error/failure.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  final AnalysisRemoteDatasource remoteDatasource;

  AnalysisRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, AnalysisResult>> analyzeReview(
      ReviewRequest request) async {
    try {
      final requestModel = ReviewRequestModel(reviewText: request.reviewText);
      final resultModel = await remoteDatasource.analyzeReview(requestModel);
      final result = AnalysisResult(
        sentimentLabel: resultModel.sentimentLabel,
        sentimentScore: resultModel.sentimentScore,
        authenticityScore: resultModel.authenticityScore,
        authenticityLabel: resultModel.authenticityLabel,
        summary: resultModel.summary,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}