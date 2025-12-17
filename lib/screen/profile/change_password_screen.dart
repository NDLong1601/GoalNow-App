import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _currentCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentCtrl.addListener(_rebuild);
    _newCtrl.addListener(_rebuild);
    _confirmCtrl.addListener(_rebuild);
  }

  void _rebuild() => setState(() {}); // ✅ FIX THIẾU

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final isBusy = provider.isLoading;

    final current = _currentCtrl.text.trim();
    final next = _newCtrl.text.trim();
    final confirm = _confirmCtrl.text.trim();

    final canSave =
        !isBusy &&
        current.isNotEmpty &&
        next.length >= 6 &&
        next == confirm &&
        next != current;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(
            text: 'Change Password',
            style: AppTextStyle.appBarTitle,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: isBusy
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppPasswordField(
                  label: 'Current Password',
                  hint: 'Enter your current password',
                  controller: _currentCtrl,
                ),
                const SizedBox(height: 12),

                AppPasswordField(
                  label: 'New Password',
                  hint: 'Enter your new password',
                  controller: _newCtrl,
                ),
                const SizedBox(height: 12),

                AppPasswordField(
                  label: 'Confirm New Password',
                  hint: 'Confirm your new password',
                  controller: _confirmCtrl,
                ),

                if (provider.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      provider.error!,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),

                const SizedBox(height: 24),

                Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  decoration: BoxDecoration(
                    color: AppColor.iconSecondary,
                    borderRadius: BorderRadius.circular(16),
                    border: BoxBorder.all(style: BorderStyle.solid),
                  ),
                  child: AppText(
                    text:
                        'When you change your password, you will be logged out of all other devices and browser sessions.',
                    style: AppTextStyle.bodySmall,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),

                // const SizedBox(height: 24),
                // const Spacer(),
                AppButton(
                  text: isBusy ? 'Saving...' : 'Save',
                  type: canSave
                      ? AppButtonType.primary
                      : AppButtonType.disabled,
                  onPressed: !canSave
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          final userProvider = context.read<UserProvider>();
                          final navigator = Navigator.of(context);

                          final ok = await userProvider.changePassword(
                            currentPassword: current,
                            newPassword: next,
                          );

                          if (!mounted) return;

                          if (ok) {
                            navigator.pop(true);
                          }
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
