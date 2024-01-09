// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as int,
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
    };

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      devMessage: json['devMessage'] as String?,
      errorCode: json['errorCode'] as int?,
      path: json['path'] as String?,
      rowNumber: json['rowNumber'] as int?,
      userMessage: json['userMessage'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'userMessage': instance.userMessage,
      'errorCode': instance.errorCode,
      'devMessage': instance.devMessage,
      'path': instance.path,
      'rowNumber': instance.rowNumber,
      'value': instance.value,
    };

RegisterDataModel _$RegisterDataModelFromJson(Map<String, dynamic> json) =>
    RegisterDataModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$RegisterDataModelToJson(RegisterDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
