import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import "package:shoal_app/core/constants/constants.dart";
import "package:shoal_app/modules/auth/data/models/login_response_model.dart";
import "package:shoal_app/modules/auth/data/models/register_response_model.dart";

part 'auth_datasource.g.dart';

@RestApi(baseUrl: AppConstants.APP_BASE_URL)
abstract class AuthDatasource {
  factory AuthDatasource(Dio dio) = _AuthDatasource;

  ///
  /// Login
  @POST(AppConstants.APP_LOGIN_URL)
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() Map<String, dynamic> payload,
  );

  ///
  /// Register
  @POST(AppConstants.APP_REGISTER_URL)
  Future<HttpResponse<RegisterResponseModel>> register(
    @Body() Map<String, dynamic> payload,
  );
}
