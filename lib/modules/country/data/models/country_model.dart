import 'package:json_annotation/json_annotation.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';

part "country_model.g.dart";

@JsonSerializable()
class CountryModel extends CountryEntity {
  const CountryModel({super.id, super.name, super.isoCode});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
