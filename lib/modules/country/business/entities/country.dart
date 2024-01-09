import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? id;
  final String? name;
  final String? isoCode;

  const CountryEntity({this.id, this.name, this.isoCode});

  @override
  List<Object?> get props => [id, name, isoCode];
}
