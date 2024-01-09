import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/errors/failure.dart';

final errorProvider = StateProvider.autoDispose<Failure?>((ref) => null);
