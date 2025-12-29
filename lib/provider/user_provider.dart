import 'package:flutter/material.dart';
import 'package:goalnow_app/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  bool isLoading = false;
  String? error;

  User? get user => _user;

  /// SIGN UP
  void setUser({
    required String name,
    required String email,
    required String password,
  }) {
    _user = User(name: name, email: email, password: password, avatarUrl: null);
    notifyListeners();
  }

  /// UPDATE NAME
  Future<void> updateName(String name) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 600));
      _user = _user!.copyWith(name: name);
    } catch (_) {
      error = 'Failed to update name';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// UPDATE EMAIL
  Future<void> updateEmail(String email) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 600));
      _user = _user!.copyWith(email: email);
    } catch (_) {
      error = 'Failed to update email';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// VERIFY PASSWORD
  Future<bool> verifyPassword(String inputPassword) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 600));

      if (_user == null || _user!.password != inputPassword) {
        throw Exception('Incorrect password');
      }

      return true;
    } catch (_) {
      error = 'Incorrect password';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Change Password
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 600));

      if (_user == null || _user!.password != currentPassword) {
        throw Exception('Incorrect current password');
      }

      _user = _user!.copyWith(password: newPassword);
      return true;
    } catch (_) {
      error = 'Incorrect current password';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
