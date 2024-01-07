import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab.g.dart';

@riverpod
class Tab extends _$Tab {
  @override
  int build() => 0;

  void onTabChange(int value) {
    state = value;
  }
}
