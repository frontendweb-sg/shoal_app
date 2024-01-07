import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Theme provider
/// Later will need to change make it more verbose
/// now only updating true/false
///
final themeProvider = StateProvider<bool>((ref) => false);
