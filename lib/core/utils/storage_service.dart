import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoal_app/core/constants/constants.dart';

///
/// Storage service
/// store data locally for the whole app
/// 1. Store token
/// 2.
///
class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setValue(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool userFirstTimeOpenApp() {
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  bool get userIsAuthenticated {
    String? token = _preferences.getString(AppConstants.APP_AUTH_TOKEN);
    if (token == null || token.isEmpty) {
      return false;
    }
    return true;
  }

  String get getToken {
    String? token = _preferences.getString(AppConstants.APP_AUTH_TOKEN);
    return token!;
  }

  Future<bool> logout() {
    return _preferences.remove(AppConstants.APP_AUTH_TOKEN);
  }
}
