// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      apiResponseStatus: json['apiResponseStatus'] as String?,
      httpStatus: json['httpStatus'] as int?,
      message: json['message'] as String?,
      data: const LoginDataConverter()
          .fromJson(json['data'] as Map<String, dynamic>?),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'apiResponseStatus': instance.apiResponseStatus,
      'httpStatus': instance.httpStatus,
      'message': instance.message,
      'data': const LoginDataConverter().toJson(instance.data),
      'errors': instance.errors,
    };
