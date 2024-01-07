import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/core/i18n/contents.dart';

class ErrorHandler implements Exception {
  late final Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  cancel,
  connectTimeout,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return const Failure(
            message: ResponseMessage.success, statusCode: ResponseCode.success);
      case DataSource.badRequest:
        return const Failure(
            message: ResponseMessage.badRequest,
            statusCode: ResponseCode.badRequest);
      case DataSource.cacheError:
        return const Failure(
            message: ResponseMessage.cacheError,
            statusCode: ResponseCode.cacheError);
      case DataSource.cancel:
        return const Failure(
            message: ResponseMessage.cancel, statusCode: ResponseCode.cancel);
      case DataSource.connectTimeout:
        return const Failure(
            message: ResponseMessage.connectTimeout,
            statusCode: ResponseCode.connectTimeout);
      case DataSource.forbidden:
        return const Failure(
            message: ResponseMessage.forbidden,
            statusCode: ResponseCode.forbidden);
      case DataSource.internalServerError:
        return const Failure(
            message: ResponseMessage.internalServerError,
            statusCode: ResponseCode.internalServerError);
      case DataSource.noInternetConnection:
        return const Failure(
            message: ResponseMessage.noInternetConnection,
            statusCode: ResponseCode.noInternetConnection);
      case DataSource.recieveTimeout:
        return const Failure(
            message: ResponseMessage.recieveTimeout,
            statusCode: ResponseCode.recieveTimeout);
      case DataSource.sendTimeout:
        return const Failure(
            message: ResponseMessage.sendTimeout,
            statusCode: ResponseCode.sendTimeout);
      case DataSource.unauthorized:
        return const Failure(
            message: ResponseMessage.unauthorized,
            statusCode: ResponseCode.unauthorized);
      default:
        return const Failure(
            message: ResponseMessage.defaultError,
            statusCode: ResponseCode.defaultError);
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.recieveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        if (kDebugMode) {
          print(error.response);
        }
        return Failure(
          statusCode: error.response?.statusCode ?? 0,
          message: error.response?.statusMessage ?? "",
          // data: error.response!.data,
        );
      } else {
        return DataSource.badRequest.getFailure();
      }
    default:
      return DataSource.defaultError.getFailure();
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int forbidden = 403;
  static const int unauthorized = 401;

  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int recieveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String success = AppContent.strSuccess;
  static const String noContent = AppContent.strNoContent;
  static const String badRequest = AppContent.strBadRequestError;
  static const String unauthorized = AppContent.strUnauthorizedError;
  static const String forbidden = AppContent.strForbiddenError;
  static const String internalServerError = AppContent.strInternalServerError;
  static const String notFound = AppContent.strNotFoundError;

  // local status code
  static const String connectTimeout = AppContent.strTimeoutError;
  static const String cancel = AppContent.strDefaultError;
  static const String recieveTimeout = AppContent.strTimeoutError;
  static const String sendTimeout = AppContent.strTimeoutError;
  static const String cacheError = AppContent.strDefaultError;
  static const String noInternetConnection = AppContent.strNoInternetError;
  static const String defaultError = AppContent.strDefaultError;
}
