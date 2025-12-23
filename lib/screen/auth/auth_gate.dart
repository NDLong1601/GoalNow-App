import 'package:flutter/material.dart';
import 'package:goalnow_app/screen/auth/sign_in_form.dart';
import 'package:goalnow_app/screen/bottom_tab/bottom_tab.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/provider/auth_provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    if (auth.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (auth.isSignedIn) {
      return const BottomTab(); // AppRoute.bottomTab
    }

    return const SignInScreen(); // AppRoute.signIn
  }
}
