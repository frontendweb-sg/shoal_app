import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoal_app/core/utils/dio_client.dart';

///
/// A global dio client provider
///
///
final dioClientProvider = Provider<Dio>((ref) {
  DioClient dioClient = DioClient();
  return dioClient.client;
});
