import 'package:dio/dio.dart';
import 'package:reviewsense_frontend/core/error/failure.dart';

final class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final Failure failure;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        failure = Failure(message: 'Connection error: ${err.message}');
        break;
      case DioExceptionType.badResponse:
        final code = err.response?.statusCode;
        final msg  = _extractMessage(err.response) ?? 'Server error ($code)';
        failure = Failure(message: msg);
        break;
      default:
        failure = Failure(message: 'Unexpected error: ${err.message}');
    }
    // DioException.error is final in Dio 5+ — create a new exception instead.
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: failure,
        message: err.message,
      ),
    );
  }

  String? _extractMessage(Response? response) {
    try {
      return response?.data['message'] as String?;
    } catch (_) {
      return null;
    }
  }
}