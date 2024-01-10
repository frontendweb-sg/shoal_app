import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shoal_app/core/errors/exception.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/auth/business/repos/auth.dart';
import 'package:shoal_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:shoal_app/modules/auth/data/models/login_response_model.dart';
import 'package:shoal_app/modules/auth/data/models/register_response_model.dart';

class AuthRepoImp extends AuthRepo {
  final AuthDatasource _authDatasource;
  AuthRepoImp(this._authDatasource);

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      Map<String, dynamic> payload) async {
    try {
      final httpResponse = await _authDatasource.login(payload);

      if (httpResponse.data.apiResponseStatus == 'Failed') {
        return Left(
          Failure(
            statusCode: 106,
            message: httpResponse.data.errors![0]['devMessage'],
          ),
        );
      }

      return Right(httpResponse.data);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
      Map<String, dynamic> payload) async {
    try {
      final httpResponse = await _authDatasource.register(payload);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(ErrorHandler.handle(httpResponse.response.data).failure);
      }
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
