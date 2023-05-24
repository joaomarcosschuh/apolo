// flashcards_module.dart
import 'package:flutter/material.dart';
import 'flashcards_page.dart';
import 'flashcards_controller.dart';
import '/shared/repositories/flashcard_repository.dart';

class FlashcardsModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlashcardRepository flashcardRepository = FlashcardRepository();
    FlashcardsController flashcardsController = FlashcardsController(flashcardRepository);
    FlashcardsPage flashcardsPage = FlashcardsPage(flashcardsController);

    return MaterialApp(
      title: 'Flashcards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: flashcardsPage,
    );
  }
}
