import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:shoal_app/modules/loan/presenter/providers/state/country_state.dart';
import 'package:shoal_app/shared/providers/graphql.dart';

class CountryNotifier extends StateNotifier<CountryState> {
  GraphQLClient graphQLClient;
  CountryNotifier(this.graphQLClient) : super(CountryState.initial());

  Future<void> getAllCountry(String query) async {
    try {
      // DioClient dioClient = DioClient(AppConstants.APP_BASE_GRAPHQL_URL);
      var response = await graphQLClient.query(
        QueryOptions(
          document: gql(query),
        ),
      );
      print(response);

      List<dynamic> data = response.data!["countries"];
      print(data);
    } catch (error) {
      print(error);
    }
  }
}

final countryProvider =
    StateNotifierProvider<CountryNotifier, CountryState>((ref) {
  return CountryNotifier(ref.watch(graphqlClientProvider));
});
