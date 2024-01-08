import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoal_app/modules/loan/data/models/country.dart';

part 'country_state.freezed.dart';

@freezed
class CountryState with _$CountryState {
  factory CountryState.initial() = _Initial;
  factory CountryState.loading() = _Loading;
  factory CountryState.fetched(List<Country> countries) = _Fetched;
  factory CountryState.error(String error) = _Error;
}
