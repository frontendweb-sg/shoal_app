import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/constants/constants.dart';
import 'package:shoal_app/core/errors/failure.dart';
import 'package:shoal_app/globals.dart';

import 'package:shoal_app/modules/auth/business/actions/login.dart';
import 'package:shoal_app/modules/auth/business/entities/login_response_entity.dart';
import 'package:shoal_app/modules/auth/business/repos/auth.dart';
import 'package:shoal_app/modules/auth/presenter/providers/auth.dart';

///
/// Login notifier
///
class LoginNotifier extends StateNotifier<AsyncValue<LoginResponseEntity?>> {
  final AuthRepo _auth;
  LoginNotifier(this._auth) : super(const AsyncValue.data(null));

  ///
  /// Login method
  ///
  Future<void> login(Map<String, dynamic> payload) async {
    try {
      state = const AsyncLoading();

      final response = await LoginAction(_auth).call(params: payload);

      state = response.fold(
        (l) => AsyncValue.error(l.message, StackTrace.current),
        (data) {
          if (data.data != null) {
            Global.storage.setValue(
              AppConstants.APP_AUTH_TOKEN,
              data.data!.accessToken,
            );
          }

          return AsyncValue.data(data);
        },
      );
    } on Failure catch (error) {
      state = AsyncError(error.message, StackTrace.current);
    }
  }
}

///
/// Login provider
///
final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier,
    AsyncValue<LoginResponseEntity?>>(
  (ref) => LoginNotifier(
    ref.watch(authImpProvider),
  ),
);
