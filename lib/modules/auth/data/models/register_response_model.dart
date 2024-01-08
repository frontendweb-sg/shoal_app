import 'package:json_annotation/json_annotation.dart';
import 'package:shoal_app/modules/auth/business/entities/register_response_entity.dart';
import './json_converter.dart';

part 'register_response_model.g.dart';

@JsonSerializable(converters: [RegisterDataConverter()])
class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.apiResponseStatus,
    required super.httpStatus,
    required super.message,
    required super.data,
    required super.errors,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
