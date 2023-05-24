// user_repository.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up method
  Future<void> signUp(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel user = UserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
    await _firestore.collection('users').doc(user.id).set(user.toJson());
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign out method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Fetch user data method
  Future<UserModel> fetchUserData() async {
    DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).get();
    return UserModel.fromJson(documentSnapshot.data()!);
  }
}
