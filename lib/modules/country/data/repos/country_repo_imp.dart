import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/modules/country/business/repos/country_repo.dart';
import 'package:shoal_app/modules/country/data/models/country_model.dart';
import 'package:shoal_app/modules/country/data/datasource/country_remote_service.dart';

class CountryRepoImp extends CountryRepo {
  final CountryRemoteService _remoteService;
  CountryRepoImp(this._remoteService);

  @override
  Future<Either<Failure, List<CountryModel>>> getAllCountry(
      QueryParam queryParam) async {
    try {
      final result = await _remoteService.getAllCountry(queryParam);
      return Right(result);
    } on GraphQLError catch (error) {
      throw left(error);
    }
  }

  @override
  Future<Either<Failure, void>> addCountry(MutationParam mutationParam) async {
    try {
      final response = await _remoteService.addCountry(mutationParam);

      if (response.exception!.graphqlErrors.isNotEmpty) {
        return Left(
          Failure(
            message: response.exception!.graphqlErrors[0].message,
            statusCode: 400,
          ),
        );
      }
      Map<String, dynamic> data = response.data!;
      return Right(data);
    } on GraphQLError catch (error) {
      throw left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCountry(MutationParam mutationParam) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateCountry(MutationParam mutationParam) {
    // TODO: implement updateCountry
    throw UnimplementedError();
  }
}
