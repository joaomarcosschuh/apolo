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
        title: Text('Autenticação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed: () async {
                await widget._controller.signUp(
                  _emailController.text,
                  _passwordController.text,
                );
              },
            ),
            ElevatedButton(
              child: Text('Entrar'),
              onPressed: () async {
                await widget._controller.signIn(
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
