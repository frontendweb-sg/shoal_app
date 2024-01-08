// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseModel(
      apiResponseStatus: json['apiResponseStatus'] as String?,
      httpStatus: json['httpStatus'] as int?,
      message: json['message'] as String?,
      data: const RegisterDataConverter()
          .fromJson(json['data'] as Map<String, dynamic>?),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$RegisterResponseModelToJson(
        RegisterResponseModel instance) =>
    <String, dynamic>{
      'apiResponseStatus': instance.apiResponseStatus,
      'httpStatus': instance.httpStatus,
      'message': instance.message,
      'data': const RegisterDataConverter().toJson(instance.data),
      'errors': instance.errors,
    };
