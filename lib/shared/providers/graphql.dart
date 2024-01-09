import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/graphql/config.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';

// final graphqlClientProvider = Provider<GraphQLClient>(
//   (ref) {
//     //final String token = ref.watch(tokenProvider).state;
//     //StorageService storageService = Global.storage;

//     //print("storageService.getToken ${storageService.getToken}");
//     final Link link = HttpLink("https://rickandmortyapi.com/graphql");

//     print("link $link");
//     return GraphQLClient(
//       cache: GraphQLCache(),
//       link: link,
//     );
//   },
//   name: "GraphQL Client Provider",
// );

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  GraphQlConfig config = GraphQlConfig();

  return config.init();
});
