import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a user model
class User {
  final String username;
  final String handle;
  final String profilePicture;

  User({required this.username, required this.handle, required this.profilePicture});
}

// StateNotifier to manage user state
class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }
}

// Provider for user data
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});
