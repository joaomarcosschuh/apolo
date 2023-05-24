// flashcard_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardModel {
  String id;
  String question;
  String answer;
  double easinessFactor;
  int repetitions;
  int interval;

  FlashcardModel({
    this.id,
    this.question,
    this.answer,
    this.easinessFactor,
    this.repetitions,
    this.interval,
  });

  FlashcardModel.fromDocumentSnapshot(DocumentSnapshot doc)
      : id = doc.id,
        question = doc['question'],
        answer = doc['answer'],
        easinessFactor = doc['easinessFactor'],
        repetitions = doc['repetitions'],
        interval = doc['interval'];

  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'question': question,
      'answer': answer,
      'easinessFactor': easinessFactor,
      'repetitions': repetitions,
      'interval': interval,
    };
  }
}
