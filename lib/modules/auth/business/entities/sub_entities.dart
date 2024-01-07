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
