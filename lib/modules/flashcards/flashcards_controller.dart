// flashcards_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flashcard_model.dart';

class FlashcardsController {
  final CollectionReference _flashcardsCollection = FirebaseFirestore.instance.collection('flashcards');

  Future<List<FlashcardModel>> fetchFlashcards() async {
    QuerySnapshot querySnapshot = await _flashcardsCollection.get();
    return querySnapshot.docs.map((doc) => FlashcardModel.fromDocumentSnapshot(doc)).toList();
  }

  Future<void> updateFlashcard(FlashcardModel flashcard) {
    return _flashcardsCollection.doc(flashcard.id).update(flashcard.toDocumentSnapshot());
  }

  Future<void> addFlashcard(FlashcardModel flashcard) {
    return _flashcardsCollection.add(flashcard.toDocumentSnapshot());
  }
}
