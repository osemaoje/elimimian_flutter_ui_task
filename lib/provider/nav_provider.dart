import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0); // Default index is 0

  void setIndex(int index) => state = index;
}

final navBarProvider = StateNotifierProvider<NavBarNotifier, int>((ref) {
  return NavBarNotifier();
});
