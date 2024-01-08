import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/constants/constants.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/globals.dart';

import 'package:shoal_app/modules/auth/business/actions/login.dart';
import 'package:shoal_app/modules/auth/business/entities/login_response_entity.dart';
import 'package:shoal_app/modules/auth/business/interface/auth.dart';
import 'package:shoal_app/modules/auth/presenter/providers/auth.dart';

///
/// Login notifier
///
class LoginNotifier extends StateNotifier<AsyncValue<LoginResponseEntity?>> {
  final AuthInterface _auth;
  LoginNotifier(this._auth) : super(const AsyncValue.data(null));

  ///
  /// Login method
  ///
  Future<void> login(Map<String, dynamic> payload) async {
    try {
      // start loading
      state = const AsyncLoading();

      // hit url for authenticating
      final response = await LoginAction(_auth).call(params: payload);

      // store response success / failure in state
      state = response.fold(
        (l) => AsyncValue.error(l, StackTrace.current),
        (r) {
          // set auth token in local storage
          Global.storage.setValue(
            AppConstants.APP_AUTH_TOKEN,
            r.data!.accessToken,
          );

          // save success response in state
          return AsyncValue.data(r);
        },
      );
    } on Failure catch (error) {
      // catch and store error
      state = AsyncValue.error(error.message, StackTrace.current);
    }
  }
}

///
/// Login provider
///
final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginResponseEntity?>>(
  (ref) => LoginNotifier(
    ref.watch(authImpProvider),
  ),
);
