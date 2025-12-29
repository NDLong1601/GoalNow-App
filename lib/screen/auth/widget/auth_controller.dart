import 'package:flutter/material.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:provider/provider.dart';

class AuthController {
  static void signUp({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String name,
    required String email,
    required String password,
  }) {
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;
    
    final userProvider = context.read<UserProvider>();
    final navigator = Navigator.of(context);

    userProvider.setUser(
      name: name.trim(),
      email: email.trim(),
      password: password.trim(),
    );

    navigator.pushReplacementNamed(
      AppRoute.bottomTab,
      arguments: {
        'showSuccess': true,
        'message': 'Account created successfully, welcome $name',
      },
    );
  }
}

