import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient([String? baseUrl]) {
    _dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 5000),
        connectTimeout: const Duration(seconds: 5000),
        sendTimeout: const Duration(seconds: 5000),
        contentType: Headers.jsonContentType,
      ),
    );
  }

  Dio get client => _dio;
}
