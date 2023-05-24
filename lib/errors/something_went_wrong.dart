// something_went_wrong.dart
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Algo deu errado!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
