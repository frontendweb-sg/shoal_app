import 'dart:io';

///
/// Host override service
/// this is use for https override
///
class HostOverrideService extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final isValidHost = ['10.0.2.2'].contains(host);
        return isValidHost;
      });
  }
}
