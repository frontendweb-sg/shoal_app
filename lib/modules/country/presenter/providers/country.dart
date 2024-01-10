import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/modules/country/business/entities/country.dart';
import 'package:shoal_app/modules/country/business/repos/country_repo.dart';
import 'package:shoal_app/modules/country/data/datasource/country_remote_service.dart';
import 'package:shoal_app/modules/country/data/repos/country_repo_imp.dart';
import 'package:shoal_app/shared/providers/error.dart';
import 'package:shoal_app/shared/providers/graphql.dart';

///
/// Country notifier
///
class CountryNotifier extends StateNotifier<AsyncValue<List<CountryEntity>>> {
  final CountryRepo countryRepo;
  final StateController<Failure?> failure;
  CountryNotifier(this.countryRepo, this.failure)
      : super(const AsyncValue.data([]));

  ///
  /// Get all country
  Future<void> getAllCountry(String query) async {
    try {
      state = const AsyncLoading();

      final response = await countryRepo.getAllCountry(
        QueryParam(
          document: query,
        ),
      );

      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) => AsyncValue.data(r),
      );
    } on Failure catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }

  ///
  /// Get all country
  Future<void> getRefreshData(String query) async {
    try {
      state = const AsyncLoading();

      final response = await countryRepo.getAllCountry(
        QueryParam(
          document: query,
        ),
      );
      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) => AsyncValue.data(r),
      );

      state = state.copyWithPrevious(
        state,
        isRefresh: true,
      );
    } on Failure catch (error) {
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }

  ///
  /// Add country
  Future<bool> addCountry(MutationParam mutationParam) async {
    try {
      var response = await countryRepo.addCountry(
        MutationParam(
          document: mutationParam.document,
          variables: mutationParam.variables,
        ),
      );

      response.fold(
        (l) {
          failure.state = Failure(message: l.message, statusCode: l.statusCode);
          return false;
        },
        (r) async {
          state = AsyncValue.data([r as CountryEntity, ...state.value!]);
        },
      );

      state = state.copyWithPrevious(
        state,
        isRefresh: true,
      );

      return true;
    } catch (error) {
      failure.state = Failure(message: error.toString(), statusCode: 400);
      return false;
    }
    // response.foldRight(z, (r, previous) => null);
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
  return CountryNotifier(
      ref.watch(countryRepoProvider), ref.watch(errorProvider.notifier));
});
