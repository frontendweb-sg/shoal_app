import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/constants/constants.dart';

class GraphQlConfig {
  HttpLink httpLink = HttpLink(AppConstants.APP_BASE_GRAPHQL_URL);

  ValueNotifier<GraphQLClient> init(String token) {
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );
    return ValueNotifier(
      GraphQLClient(
        link: authLink.concat(httpLink),
        cache: GraphQLCache(),
      ),
    );
  }
}
