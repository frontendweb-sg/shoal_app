import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoal_app/modules/auth/business/repos/auth.dart';
import 'package:shoal_app/modules/auth/data/datasource/auth_datasource.dart';
import 'package:shoal_app/modules/auth/data/repos/auth_imp.dart';
import 'package:shoal_app/shared/providers/dio.dart';

///
/// Auth service provider
/// Initialize service for interact with api
///
final authDatasourceProvider = Provider<AuthDatasource>(
  (ref) => AuthDatasource(
    ref.watch(dioClientProvider),
  ),
);

///
/// Auth repository provider
/// Initialize repository to interact with auth service
///
final authImpProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImp(
    ref.watch(authDatasourceProvider),
  ),
);
