import 'package:json_annotation/json_annotation.dart';
import 'package:shoal_app/modules/auth/business/entities/sub_entities.dart';
import './sub_models.dart';

///
/// Login data converter
///
class LoginDataConverter
    implements JsonConverter<LoginDataEntity?, Map<String, dynamic>?> {
  const LoginDataConverter();

  @override
  LoginDataEntity? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LoginDataModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginDataEntity? object) {
    if (object == null) {
      return null;
    }
    return LoginDataModel(
            accessToken: object.accessToken,
            expiresIn: object.expiresIn,
            refreshToken: object.refreshToken)
        .toJson();
  }
}

///
/// Register data converter
class RegisterDataConverter
    implements JsonConverter<RegisterDataEntity?, Map<String, dynamic>?> {
  const RegisterDataConverter();

  @override
  RegisterDataEntity? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RegisterDataModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(RegisterDataEntity? json) {
    if (json == null) {
      return null;
    }
    return RegisterDataModel(message: json.message).toJson();
  }
}
