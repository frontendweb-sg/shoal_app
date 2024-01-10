import 'package:dio/dio.dart';

final dio = Dio();

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Amz-Target'] =
        'AWSCognitoIdentityProviderService.InitiateAuth';
    options.headers['Content-Type'] = 'application/x-amz-json-1.1';

    super.onRequest(options, handler);
  }
}
