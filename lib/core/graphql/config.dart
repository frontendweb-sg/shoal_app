import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/constants/constants.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';

class GraphQlConfig {
  StorageService storageService = Global.storage;

  // HttpLink httpLink = HttpLink(AppConstants.APP_BASE_GRAPHQL_URL);
  GraphQLClient init([String? token]) {
    final Link link =
        HttpLink(AppConstants.APP_BASE_GRAPHQL_URL, defaultHeaders: {
      if (storageService.getToken != '')
        'Authorization': 'Bearer ${storageService.getToken}',
    });

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }
}
