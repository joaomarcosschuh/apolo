// flashcard_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flashcard_model.dart';

class FlashcardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch flashcards method
  Future<List<FlashcardModel>> fetchFlashcards() async {
    QuerySnapshot querySnapshot = await _firestore.collection('flashcards').get();
    return querySnapshot.docs.map((doc) => FlashcardModel.fromJson(doc.data())).toList();
  }

  // Add flashcard method
  Future<void> addFlashcard(FlashcardModel flashcard) async {
    await _firestore.collection('flashcards').add(flashcard.toJson());
  }

  // Update flashcard method
  Future<void> updateFlashcard(FlashcardModel flashcard) async {
    await _firestore.collection('flashcards').doc(flashcard.id).update(flashcard.toJson());
  }

  // Delete flashcard method
  Future<void> deleteFlashcard(String flashcardId) async {
    await _firestore.collection('flashcards').doc(flashcardId).delete();
  }
}
