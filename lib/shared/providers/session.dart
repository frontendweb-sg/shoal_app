import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/session/session.dart';

final sessionProvider = StateProvider<Session>((ref) => Session());

final sessionEnableAuth =
    StateProvider<bool>((ref) => ref.watch(sessionProvider).enableAuthPage);
