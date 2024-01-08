import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/constants/constants.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(AppConstants.APP_BASE_GRAPHQL_URL);

  static ValueNotifier<GraphQLClient> init(String token) {
    if (token.isNotEmpty) {
      httpLink.defaultHeaders['authorization'] = 'Bearer $token';
    }

    return ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
  }
}
