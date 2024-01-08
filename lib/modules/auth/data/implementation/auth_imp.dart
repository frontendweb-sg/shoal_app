import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/auth/business/entities/login_response_entity.dart';
import 'package:shoal_app/modules/auth/business/entities/register_response_entity.dart';
import 'package:shoal_app/modules/auth/business/interface/auth.dart';
import 'package:shoal_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:shoal_app/modules/auth/data/models/register_response_model.dart';

class AuthImplementation extends AuthInterface {
  final AuthDatasource _authDatasource;
  AuthImplementation(this._authDatasource);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      Map<String, dynamic> payload) async {
    try {
      final httpResponse = await _authDatasource.login(payload);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(httpResponse.response.data);
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Left(error);
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
        return Left(httpResponse.response.data);
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Left(error);
    }
  }
}
