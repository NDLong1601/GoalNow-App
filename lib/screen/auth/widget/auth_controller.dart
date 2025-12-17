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
  }) {
    final form = formKey.currentState;

    if (form == null || !form.validate()) return;

    context.read<UserProvider>().setUser(name: name, email: email);

    Navigator.pushReplacementNamed(
      context,
      AppRoute.bottomTab,
      arguments: {
        'showSuccess': true,
        'message': 'Account created successfully, welcome $name',
      },
    );
  }
}
