import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class VerifyPasswordDialog extends StatefulWidget {
  const VerifyPasswordDialog({super.key});

  @override
  State<VerifyPasswordDialog> createState() => _VerifyPasswordDialogState();
}

class _VerifyPasswordDialogState extends State<VerifyPasswordDialog> {
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final isBusy = provider.isLoading;

    return AlertDialog(
      title: const Text('Verify Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppPasswordField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _passwordCtrl,
          ),
          if (provider.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                provider.error!,
                style: AppTextStyle.bodySmall.copyWith(color: Colors.redAccent),
              ),
            ),
        ],
      ),
      actions: [
        AppButton(
          text: 'Cancel',
          type: AppButtonType.secondary,
          onPressed: isBusy ? null : () => Navigator.pop(context, false),
        ),
        const SizedBox(height: 16),
        AppButton(
          text: isBusy ? 'Verifying...' : 'Verify',
          type: isBusy ? AppButtonType.disabled : AppButtonType.primary,
          onPressed: isBusy
              ? null
              : () async {
                  FocusScope.of(context).unfocus();

                  // CACHE TRƯỚC ASYNC GAP
                  final userProvider = context.read<UserProvider>();
                  final navigator = Navigator.of(context);

                  final ok = await userProvider.verifyPassword(
                    _passwordCtrl.text.trim(),
                  );

                  if (!mounted) return;

                  if (ok) {
                    navigator.pop(true);
                  }
                },
        ),
      ],
    );
  }
}
