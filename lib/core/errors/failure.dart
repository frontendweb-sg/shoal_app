import 'package:equatable/equatable.dart';

///
/// Failure class
/// used to convert the catch error into this.
///
class Failure extends Equatable {
  final String message;
  final int statusCode;
  final String? data;

  const Failure({required this.message, required this.statusCode, this.data});

  @override
  List<Object?> get props => [
        message,
        statusCode,
        data,
      ];
}
