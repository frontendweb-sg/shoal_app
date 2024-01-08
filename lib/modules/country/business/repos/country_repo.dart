import 'package:dartz/dartz.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';

abstract class CountryRepo {
  Future<Either<Failure, List<CountryEntity>>> getAllCountry(
      String document, Map<String, dynamic>? variables);
}
