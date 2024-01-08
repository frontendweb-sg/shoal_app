import 'package:dartz/dartz.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/core/usecases/usecase.dart';
import 'package:shoal_app/modules/auth/business/entities/register_response_entity.dart';
import 'package:shoal_app/modules/auth/business/interface/auth.dart';

///
/// Login usecase
///
class LoginAction
    extends UseCase<RegisterResponseEntity, Map<String, dynamic>> {
  final AuthInterface _auth;

  LoginAction(this._auth);

  @override
  Future<Either<Failure, RegisterResponseEntity>> call({
    Map<String, dynamic>? params,
  }) async {
    return await _auth.register(params!);
  }
}
