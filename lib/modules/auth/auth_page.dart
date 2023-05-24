// auth_page.dart
import 'package:flutter/material.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final AuthController _controller;

  AuthPage(this._controller);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {
                widget._controller.signUp(
                  _emailController.text,
                  _passwordController.text,
                );
              },
            ),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                widget._controller.signIn(
                  _emailController.text,
                  _passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
