import 'package:json_annotation/json_annotation.dart';
import 'package:shoal_app/modules/auth/business/entities/sub_entities.dart';

part "sub_models.g.dart";

///
/// Login data model
///
@JsonSerializable()
class LoginDataModel extends LoginDataEntity {
  const LoginDataModel({
    required super.accessToken,
    required super.refreshToken,
    required super.expiresIn,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
}

@JsonSerializable()
class ErrorModel extends ErrorEntiry {
  const ErrorModel({
    super.devMessage,
    super.errorCode,
    super.path,
    super.rowNumber,
    super.userMessage,
    super.value,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

///
/// Register data model
///
@JsonSerializable()
class RegisterDataModel extends RegisterDataEntity {
  const RegisterDataModel({required super.message});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
}
