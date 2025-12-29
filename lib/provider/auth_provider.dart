import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalnow_app/repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repo;
  AuthProvider(this._repo) {
    _sub = _repo.authStateChanges().listen((u) {
      firebaseUser = u;
      notifyListeners();
    });
  }

  StreamSubscription<User?>? _sub;

  User? firebaseUser;
  bool isLoading = false;
  String? error;

  bool get isSignedIn => firebaseUser != null;

  Future<bool> signIn({required String email, required String password}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await _repo.signIn(email.trim(), password.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      error = e.message ?? 'Sign in failed';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signUp({required String email, required String password}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await _repo.signUp(email.trim(), password.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      error = e.message ?? 'Sign up failed';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() => _repo.signOut();

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
