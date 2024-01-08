import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/modules/country/business/repos/country_repo.dart';
import 'package:shoal_app/modules/country/data/remote/country_remote_service.dart';
import 'package:shoal_app/modules/country/data/repos/country_repo_imp.dart';

import 'package:shoal_app/modules/loan/presenter/providers/state/country_state.dart';
import 'package:shoal_app/shared/providers/graphql.dart';

final countryRemoteServiceProvider = Provider(
  (ref) => CountryRemoteService(
    ref.watch(graphqlClientProvider),
  ),
);

final countryRepoImpProvider = Provider(
  (ref) => CountryRepoImp(
    ref.watch(countryRemoteServiceProvider),
  ),
);

class CountryNotifier extends StateNotifier<CountryState> {
  final CountryRepo countryRepo;
  CountryNotifier(this.countryRepo) : super(CountryState.initial());

  Future<void> getAllCountry(String query) async {
    try {
      // DioClient dioClient = DioClient(AppConstants.APP_BASE_GRAPHQL_URL);
      var response = await countryRepo.getAllCountry(query, {});
      print(response);

      print(response);
    } catch (error) {
      print(error);
    }
  }
}

final countryProvider =
    StateNotifierProvider<CountryNotifier, CountryState>((ref) {
  return CountryNotifier(ref.watch(countryRepoImpProvider));
});
