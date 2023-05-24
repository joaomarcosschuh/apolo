// auth_module.dart
import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'auth_controller.dart';
import '/shared/repositories/user_repository.dart';

class AuthModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    AuthController authController = AuthController(userRepository);
    AuthPage authPage = AuthPage(authController);

    return MaterialApp(
      title: 'Autenticação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authPage,
    );
  }
}
