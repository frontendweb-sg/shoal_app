class AppConstants {
  // app global urls

  static const APP_BASE_URL =
      'https://xervg54662.execute-api.us-west-2.amazonaws.com/Prod/api';
  static const APP_BASE_GRAPHQL_URL = "$APP_BASE_URL/graphql";

  // auth auth urls
  static const APP_REGISTER_URL = "/Account/Register";
  static const APP_LOGIN_URL = "/Account/SignIn";

  // constants
  static const STORAGE_DEVICE_OPEN_FIRST_TIME = 'first_time';
  static const APP_AUTH_TOKEN = 'app_token';
}
