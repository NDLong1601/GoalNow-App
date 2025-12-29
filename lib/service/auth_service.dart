import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;
  // AUTH STATE CHANGES
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  // SIGN IN
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    debugPrint('SignIn called with email: $email');
    return _auth.signInWithEmailAndPassword(email: email, password: password);
    
  }

  // SIGN UP
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    debugPrint('SignUp called with email: $email');
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // SIGN OUT
  Future<void> signOut() => _auth.signOut();
}
