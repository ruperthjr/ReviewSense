import 'package:dio/dio.dart';
import 'package:reviewsense_frontend/core/config/app_config.dart';
import 'package:reviewsense_frontend/core/network/interceptors/error_interceptor.dart';
import 'package:reviewsense_frontend/core/network/interceptors/logging_interceptor.dart';

final class DioClient {
  DioClient._();

  static Dio create({required AppConfig config}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}