import 'package:firebase_auth/firebase_auth.dart';

String authError = '';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  _getUser() {
    user = _auth.currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();

      return credential.user;
    } on FirebaseAuthException catch (e) {
      authError = e.code;
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _getUser();

      return credential.user;
    } on FirebaseAuthException catch (e) {
      authError = e.code;
    }

    return null;
  }

  void signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user = auth.currentUser;

    if (user != null) {
      auth.signOut();
    }
  }
}
