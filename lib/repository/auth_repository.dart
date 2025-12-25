import 'package:firebase_auth/firebase_auth.dart';
import 'package:goalnow_app/service/auth_service.dart';

class AuthRepository {
  final AuthService _service;
  AuthRepository(this._service);

  Stream<User?> authStateChanges() => _service.authStateChanges();

  
  Future<UserCredential> signIn(String email, String password) =>
      _service.signIn(email: email, password: password);

  Future<UserCredential> signUp(String email, String password) =>
      _service.signUp(email: email, password: password);

  Future<void> signOut() => _service.signOut();
}
