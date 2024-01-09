import 'package:dartz/dartz.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/core/typedef/typedef.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';

abstract class CountryRepo {
  ///
  /// Get all country
  ///
  ResultType<List<CountryEntity>> getAllCountry(QueryParam queryParam);

  ///
  /// Add country {"country":{name,isoCode}}
  ///
  Future<Either<Failure, void>> addCountry(MutationParam mutationParam);

  ///
  /// Delete coutry by countryId
  ///
  Future<Either<Failure, void>> deleteCountry(MutationParam mutationParam);

  ///
  /// update country by id
  ///
  Future<Either<Failure, void>> updateCountry(MutationParam mutationParam);
}
