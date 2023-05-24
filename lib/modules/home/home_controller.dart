// home_controller.dart
import '../repositories/user_repository.dart';
import '../models/user_model.dart';

class HomeController {
  final UserRepository _userRepository;

  HomeController(this._userRepository);

  // Fetch user data method
  Future<UserModel> fetchUserData() async {
    return await _userRepository.fetchUserData();
  }

  // Sign out method
  Future<void> signOut() async {
    await _userRepository.signOut();
  }
}
