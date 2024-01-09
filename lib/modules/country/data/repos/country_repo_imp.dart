import 'package:dartz/dartz.dart';

import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/country/business/repos/country_repo.dart';
import 'package:shoal_app/modules/country/data/models/country_model.dart';
import 'package:shoal_app/modules/country/data/datasource/country_remote_service.dart';

class CountryRepoImp extends CountryRepo {
  final CountryRemoteService _remoteService;
  CountryRepoImp(this._remoteService);

  @override
  Future<Either<Failure, List<CountryModel>>> getAllCountry(
      String document, Map<String, dynamic>? variables) async {
    try {
      final result = await _remoteService.getAllCountry(document, variables);
      return Right(result);
    } catch (error) {
      throw left(error);
    }
  }
}
