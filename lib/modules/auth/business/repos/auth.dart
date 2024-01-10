import 'package:dartz/dartz.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/auth/business/entities/login_response_entity.dart';
import 'package:shoal_app/modules/auth/business/entities/register_response_entity.dart';

///
/// Abstract class
/// Abstract is simply a interface class
///
abstract class AuthRepo {
  Future<Either<Failure, LoginResponseEntity>> login(
    Map<String, dynamic> payload,
  );
  Future<Either<Failure, RegisterResponseEntity>> register(
      Map<String, dynamic> payload);
}
