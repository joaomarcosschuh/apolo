import 'package:flutter/material.dart';
import '/shared/repositories/user_repository.dart';

class AuthController {
  final UserRepository _userRepository;

  AuthController(this._userRepository);

  Future<void> signUp(String email, String password) async {
    await _userRepository.signUp(email, password);
  }

  Future<void> signIn(String email, String password) async {
    await _userRepository.signIn(email, password);
  }
}
