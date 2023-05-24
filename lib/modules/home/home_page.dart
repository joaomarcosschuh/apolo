// home_page.dart
import 'package:flutter/material.dart';
import 'home_controller.dart';
import '/modules/auth/auth_module.dart';
import '/modules/flashcards/flashcards_module.dart';

class HomePage extends StatefulWidget {
  final HomeController _controller;

  HomePage(this._controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _email = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    _email = (await widget._controller.fetchUserData()).email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bem-vindo, $_email!'),
            ElevatedButton(
              child: Text('Flashcards'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlashcardsModule()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Sair'),
              onPressed: () async {
                await widget._controller.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthModule()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
