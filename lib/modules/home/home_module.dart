// home_module.dart
import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(HomeController());
  }
}
