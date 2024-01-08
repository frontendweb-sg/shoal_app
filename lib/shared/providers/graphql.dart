import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/constants/constants.dart';
import 'package:shoal_app/core/graphql/config.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';

// final graphQLClientProvider = Provider<GraphQLClient>(
//   (ref) {
//     //final String token = ref.watch(tokenProvider).state;
//     StorageService storageService = Global.storage;

//     print("storageService.getToken ${storageService.getToken}");
//     final Link link =
//         HttpLink(AppConstants.APP_BASE_GRAPHQL_URL, defaultHeaders: {
//       if (storageService.getToken != '')
//         'Authorization':
//             'Bearer eyJraWQiOiJxcjMwakptd0xWVU45TGM1YnpzWDNvaWJVSkRpMEdYcStGMmJ5aGlzZTlNPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI5ZTdkYjQ5OS03YmNiLTRlMjEtYWIyZi0yODY3OGY1MTA3ODUiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtd2VzdC0yLmFtYXpvbmF3cy5jb21cL3VzLXdlc3QtMl9Kb2pnWkxEZFciLCJjbGllbnRfaWQiOiI2OG9obnYzYmhpNjRrMDhyaWlxZnUxYjFwayIsIm9yaWdpbl9qdGkiOiI1NWJmNjAxZS1iOGQ5LTQ5NTUtYjA1MC0xMDg5Yjg0MmE2NWYiLCJldmVudF9pZCI6ImQwMjE1NGE2LTk0ODgtNGU3ZS04Zjk5LWY5YmE2MjExMDI5YiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE3MDQ3MjY0MDYsImV4cCI6MTcwNDczMDAwNiwiaWF0IjoxNzA0NzI2NDA2LCJqdGkiOiJlMzQ5MzE1Ny01OWQ3LTQ3YjMtOWQxNC0zYTBhNDZmMjEzYWMiLCJ1c2VybmFtZSI6InBrdW1hciJ9.oluCA4I1hTCVUtjH-ofOCqlSZth31_jdXDcWFWLfzJZR1V2S1JEPrXrmvZEarUhfmKevaNwIKEgocBxxdhJ_eQe7-qsUGnKkSiKI-OIjgZHMbCCxo4n5Im05OYVhrB2Zety6xbUc8Z-KvxA2wULLm0kZInidERZ_hES1zBSMZLh-HDmfRUcKrlvHjOpVKj5iUCozq_XAfr6oc4Dz_Im1ndsBtde9X5uHbrti2izbNgGv--de_iTs9d0voj72GnnlQDxJZGCfYKOBvb51zofaDFuoi_ZpxH2KivgfFmdguObd_TInE7IakMH_Y4WM_pswVX_lcp42Y3JNsts-ug51tw',
//     });

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
