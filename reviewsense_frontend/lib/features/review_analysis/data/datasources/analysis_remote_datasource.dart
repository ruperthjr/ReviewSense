import 'package:dio/dio.dart';
import '../models/review_request_model.dart';
import '../models/analysis_result_model.dart';
import '../../../../core/constants/api_constants.dart';

class AnalysisRemoteDatasource {
  final Dio dio;

  AnalysisRemoteDatasource({required this.dio});

  Future<AnalysisResultModel> analyzeReview(ReviewRequestModel request) async {
    try {
      final response = await dio.post(
        ApiConstants.reviewsAnalyze,
        data: request.toJson(),
      );
      return AnalysisResultModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to analyze review: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}