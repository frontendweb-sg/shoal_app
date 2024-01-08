import 'package:json_annotation/json_annotation.dart';
import 'package:shoal_app/modules/auth/business/entities/login_response_entity.dart';
import './json_converter.dart';

part 'login_response_model.g.dart';

@JsonSerializable(converters: [LoginDataConverter()])
class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required super.apiResponseStatus,
    required super.httpStatus,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
