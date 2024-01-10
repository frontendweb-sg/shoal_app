class AppConstants {
  // app global urls

  static const APP_BASE_URL = 'https://cognito-idp.ap-south-1.amazonaws.com';
  static const APP_BASE_GRAPHQL_URL =
      "https://xervg54662.execute-api.us-west-2.amazonaws.com/Prod/graphql";

  // auth auth urls
  static const APP_REGISTER_URL = "/Account/Register";
  static const APP_LOGIN_URL = "/";

  // constants
  static const STORAGE_DEVICE_OPEN_FIRST_TIME = 'first_time';
  static const APP_AUTH_TOKEN = 'app_token';

//   {
//     "AuthParameters" : {
//         "USERNAME" : "admin1",
//         "PASSWORD" : "Friends$5"
//     },
//     "AuthFlow" : "USER_PASSWORD_AUTH",
//     "ClientId" : "2h3g84vjk1vq0ts257kuso6h73"
// }
}
