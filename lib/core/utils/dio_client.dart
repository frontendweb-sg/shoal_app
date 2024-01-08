import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient(String? baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl!));
  }

  Dio get client => _dio;
}
