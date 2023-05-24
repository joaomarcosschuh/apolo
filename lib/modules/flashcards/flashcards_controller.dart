// flashcards_controller.dart
import 'package:flutter/material.dart';
import '../../shared/repositories/flashcard_repository.dart';
import '../../shared/models/flashcard_model.dart';
import '../../shared/utils/sm2_algorithm.dart';

class FlashcardsController {
  final FlashcardRepository _flashcardRepository;

  FlashcardsController(this._flashcardRepository);

  // Fetch flashcards method
  Future<List<FlashcardModel>> fetchFlashcards() async {
    return await _flashcardRepository.fetchFlashcards();
  }

  // Add flashcard method
  Future<void> addFlashcard(String question, String answer) async {
    FlashcardModel flashcard = FlashcardModel(
      question: question,
      answer: answer,
      easinessFactor: SM2Algorithm.defaultEasinessFactor,
      repetitions: 0,
      interval: 0,
      nextReviewDate: DateTime.now(),
    );
    await _flashcardRepository.addFlashcard(flashcard);
  }

  // Update flashcard method
  Future<void> updateFlashcard(FlashcardModel flashcard) async {
    await _flashcardRepository.updateFlashcard(flashcard);
  }

  // Delete flashcard method
  Future<void> deleteFlashcard(String flashcardId) async {
    await _flashcardRepository.deleteFlashcard(flashcardId);
  }

  // Study flashcard method
  void studyFlashcard(FlashcardModel flashcard, int quality) {
    flashcard.easinessFactor = SM2Algorithm.calculateEasinessFactor(
      flashcard.easinessFactor,
      quality,
    );
    flashcard.repetitions = SM2Algorithm.calculateRepetitions(
      flashcard.repetitions,
      quality,
    );
    flashcard.interval = SM2Algorithm.calculateInterval(
      flashcard.interval,
      flashcard.repetitions,
      flashcard.easinessFactor,
    );
    flashcard.nextReviewDate = DateTime.now().add(Duration(days: flashcard.interval));
    updateFlashcard(flashcard);
  }

  // Review flashcard method
  FlashcardModel? reviewFlashcard() {
    DateTime now = DateTime.now();
    for (var flashcard in _flashcards) {
      if (flashcard.nextReviewDate.isBefore(now)) {
        return flashcard;
      }
    }
    return null;
  }
}
