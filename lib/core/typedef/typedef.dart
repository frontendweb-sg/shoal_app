import 'package:dartz/dartz.dart';
import 'package:shoal_app/core/errors/failure.dart';

// result with model
typedef ResultType<T> = Future<Either<Failure, T>>;

// result with void
typedef ResultVoid = Future<Either<Failure, void>>;
