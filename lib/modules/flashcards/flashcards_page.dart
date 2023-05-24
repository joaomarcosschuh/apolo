// flashcards_page.dart
import 'package:flutter/material.dart';
import 'flashcards_controller.dart';
import '../models/flashcard_model.dart';
import '../sm2_algorithm.dart';

class FlashcardsPage extends StatefulWidget {
  final FlashcardsController _controller;

  FlashcardsPage(this._controller);

  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  List<FlashcardModel> _flashcards = [];
  int _currentFlashcardIndex = 0;
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchFlashcards();
  }

  void _fetchFlashcards() async {
    _flashcards = await widget._controller.fetchFlashcards();
    setState(() {});
  }

  void _nextFlashcard(int quality) {
    FlashcardModel currentFlashcard = _flashcards[_currentFlashcardIndex];
    currentFlashcard.easinessFactor = SM2Algorithm.calculateEasinessFactor(
      currentFlashcard.easinessFactor,
      quality,
    );
    currentFlashcard.repetitions = SM2Algorithm.calculateRepetitions(
      currentFlashcard.repetitions,
      quality,
    );
    currentFlashcard.interval = SM2Algorithm.calculateInterval(
      currentFlashcard.interval,
      currentFlashcard.repetitions,
      currentFlashcard.easinessFactor,
    );
    widget._controller.updateFlashcard(currentFlashcard);
    if (_currentFlashcardIndex < _flashcards.length - 1) {
      _currentFlashcardIndex++;
    } else {
      _currentFlashcardIndex = 0;
    }
    setState(() {});
  }

  void _addFlashcard() {
    FlashcardModel newFlashcard = FlashcardModel(
      id: '',
      question: _questionController.text,
      answer: _answerController.text,
      easinessFactor: SM2Algorithm._defaultEasinessFactor,
      repetitions: 0,
      interval: 0,
    );
    widget._controller.addFlashcard(newFlashcard);
    _questionController.clear();
    _answerController.clear();
    _fetchFlashcards();
  }

  @override
  Widget build(BuildContext context) {
    if (_flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Flashcards'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      FlashcardModel currentFlashcard = _flashcards[_currentFlashcardIndex];
      return Scaffold(
          appBar: AppBar(
            title: Text('Flashcards'),
          ),
          body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      Text('Pergunta: ${currentFlashcard.question}'),
    Text('Resposta: ${currentFlashcard.answer}'),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    ElevatedButton(
    child: Text('Esqueci'),
    onPressed: () => _nextFlashcard(0),
    ),
    ElevatedButton(
    child: Text('Difícil'),
    onPressed: () => _nextFlashcard(1),
    ),
    ElevatedButton(
    child: Text('Bom'),
    onPressed: () => _nextFlashcard(2),
    ),
    ElevatedButton(
    child: Text('Fácil'),
    onPressed: () => _nextFlashcard(3),
    ),
    ],
    ),
    TextField(
    controller: _questionController,
    decoration: InputDecoration(
    labelText: 'Pergunta',
    ),
    ),
    TextField(
    controller: _answer{
    "link": "https://github.com/joaomarcos1804/apolo/blob/main/lib/modules/flashcards/flashcards_page.dart",
    "user_has_request": true
    }
      TextField(
      controller: _answerController,
      decoration: InputDecoration(
        labelText: 'Resposta',
      ),
    ),
            ElevatedButton(
              child: Text('Adicionar Flashcard'),
              onPressed: _addFlashcard,
            ),
          ],
          ),
          ),
      );
    }
  }
}
