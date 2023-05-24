import 'package:flutter/material.dart';
import 'flashcards_controller.dart';
import '../../shared/models/flashcard_model.dart';

class FlashcardsPage extends StatefulWidget {
  final FlashcardsController _controller;

  FlashcardsPage(this._controller);

  @override
  _FlashcardsPageState createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  List<FlashcardModel> _flashcards = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var flashcard in _flashcards)
              Card(
                child: Column(
                  children: <Widget>[
                    Text('Question: ${flashcard.question}'),
                    Text('Answer: ${flashcard.answer}'),
                    ElevatedButton(
                      child: Text('Update'),
                      onPressed: () {
                        flashcard.question = _questionController.text;
                        flashcard.answer = _answerController.text;
                        widget._controller.updateFlashcard(flashcard);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Delete'),
                      onPressed: () {
                        widget._controller.deleteFlashcard(flashcard.id);
                        _fetchFlashcards();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('Forgot'),
                          onPressed: () => widget._controller.studyFlashcard(flashcard, 0),
                        ),
                        ElevatedButton(
                          child: Text('Hard'),
                          onPressed: () => widget._controller.studyFlashcard(flashcard, 1),
                        ),
                        ElevatedButton(
                          child: Text('Good'),
                          onPressed: () => widget._controller.studyFlashcard(flashcard, 2),
                        ),
                        ElevatedButton(
                          child: Text('Easy'),
                          onPressed: () => widget._controller.studyFlashcard(flashcard, 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(labelText: 'Answer'),
            ),
            ElevatedButton(
              child: Text('Add Flashcard'),
              onPressed: () {
                widget._controller.addFlashcard(_questionController.text, _answerController.text);
                _questionController.clear();
                _answerController.clear();
                _fetchFlashcards();
              },
            ),
            ElevatedButton(
              child: Text('Review Flashcard'),
              onPressed: () {
                FlashcardModel? flashcard = widget._controller.reviewFlashcard();
                if (flashcard != null) {
                  // Show flashcard for review
                } else {
                  // Show message that there are no flashcards to review
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
