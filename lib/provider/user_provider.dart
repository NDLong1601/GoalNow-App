import 'package:flutter/material.dart';
import 'package:goalnow_app/model/user.dart';

class UserProvider extends ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  void setUser({
    required String name,
    required String email,
  }) {
    _user = AppUser(name: name, email: email);
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
