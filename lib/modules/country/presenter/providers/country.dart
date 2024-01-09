import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';
import 'package:shoal_app/modules/country/business/repos/country_repo.dart';
import 'package:shoal_app/modules/country/data/datasource/country_remote_service.dart';
import 'package:shoal_app/modules/country/data/repos/country_repo_imp.dart';
import 'package:shoal_app/shared/providers/graphql.dart';

///
/// Country notifier
///
class CountryNotifier extends StateNotifier<AsyncValue<List<CountryEntity>>> {
  final CountryRepo countryRepo;
  CountryNotifier(this.countryRepo) : super(const AsyncValue.data([]));

  Future<void> getAllCountry(String query) async {
    try {
      // loading
      state = const AsyncLoading();

      // fetching data
      var response = await countryRepo.getAllCountry(query, {});

      // store state
      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) => AsyncValue.data(r),
      );
    } on Failure catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }
}

///
/// country datasource provider
///
final countryDatasourceProvider = Provider(
  (ref) => CountryRemoteService(
    ref.watch(graphqlClientProvider),
  ),
);

///
/// Country repo provider
///
final countryRepoProvider = Provider(
  (ref) => CountryRepoImp(
    ref.watch(countryDatasourceProvider),
  ),
);

///
/// Country provider
///
final countryProvider = StateNotifierProvider.autoDispose<CountryNotifier,
    AsyncValue<List<CountryEntity>?>>((ref) {
  return CountryNotifier(ref.watch(countryRepoProvider));
});
