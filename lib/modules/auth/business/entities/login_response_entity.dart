import 'package:equatable/equatable.dart';
import 'package:shoal_app/modules/auth/business/entities/sub_entities.dart';

class LoginResponseEntity extends Equatable {
  final String? apiResponseStatus;
  final int? httpStatus;
  final String? message;
  final LoginDataEntity? data;
  final List<dynamic>? errors;

  const LoginResponseEntity({
    this.apiResponseStatus,
    this.httpStatus,
    this.message,
    this.data,
    required this.errors,
  });

  @override
  List<Object?> get props => [
        apiResponseStatus,
        httpStatus,
        message,
        data,
        errors,
      ];
}
