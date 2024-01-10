import 'package:equatable/equatable.dart';

///
/// Login data entity
///
class LoginDataEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  const LoginDataEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        expiresIn,
      ];
}

class RegisterDataEntity extends Equatable {
  final String message;

  const RegisterDataEntity({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorEntiry extends Equatable {
  final String? userMessage;
  final int? errorCode;
  final String? devMessage;
  final String? path;
  final int? rowNumber;
  final String? value;

  const ErrorEntiry(
      {this.userMessage,
      this.errorCode,
      this.devMessage,
      this.path,
      this.rowNumber,
      this.value});

  @override
  List<Object?> get props => [
        userMessage,
        errorCode,
        devMessage,
        path,
        rowNumber,
        value,
      ];
}
