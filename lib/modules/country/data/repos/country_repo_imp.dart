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
  Future<Either<Failure, CountryModel>> addCountry(
      MutationParam mutationParam) async {
    try {
      final response = await _remoteService.addCountry(mutationParam);

      if (response.data!['createCountry'] != null) {
        final data = CountryModel.fromJson(response.data!["createCountry"]);
        return Right(data);
      }

      return Left(
        Failure(
          message: response.exception!.graphqlErrors[0].message,
          statusCode: 400,
        ),
      );
    } on GraphQLError catch (error) {
      throw left(error);
    }
  }

  @override
  Future<Either<Failure, String>> deleteCountry(
      MutationParam mutationParam) async {
    try {
      final response = await _remoteService.addCountry(mutationParam);

      if (response.data!['deleteCountry'] != null) {
        final data = response.data!['deleteCountry'];
        return Right(data);
      }

      return Left(
        Failure(
          message: response.exception!.graphqlErrors[0].message,
          statusCode: 400,
        ),
      );
    } on GraphQLError catch (error) {
      throw left(error);
    }
  }

  @override
  Future<Either<Failure, void>> updateCountry(MutationParam mutationParam) {
    // TODO: implement updateCountry
    throw UnimplementedError();
  }
}
