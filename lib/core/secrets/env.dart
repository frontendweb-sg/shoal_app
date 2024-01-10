// lib/core/secrets/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'AUTH_FLOW', obfuscate: true)
  static final String authFlow = _Env.authFlow;

  @EnviedField(varName: 'CLIENT_ID', obfuscate: true)
  static final String clientId = _Env.clientId;
}
