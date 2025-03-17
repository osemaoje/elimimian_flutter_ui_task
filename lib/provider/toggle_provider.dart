import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleNotifier extends StateNotifier<bool> {
  ToggleNotifier() : super(false);

  void toggle(bool value) => state = value;
}

final toggleProvider = StateNotifierProvider<ToggleNotifier, bool>((ref) {
  return ToggleNotifier();
});
