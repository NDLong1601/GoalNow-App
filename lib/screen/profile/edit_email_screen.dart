import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/screen/profile/widget/vertify_password_dialog.dart';
import 'package:provider/provider.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  late final TextEditingController _currentCtrl;
  late final TextEditingController _newCtrl;
  late final String _initialEmail;

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProvider>().user!;
    _initialEmail = user.email;

    _currentCtrl = TextEditingController();
    _newCtrl = TextEditingController();

    _currentCtrl.addListener(() => setState(() {}));
    _newCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    super.dispose();
  }

  bool _validEmail(String v) =>
      RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final isBusy = provider.isLoading;

    final current = _currentCtrl.text.trim();
    final next = _newCtrl.text.trim();

    final canSave =
        !isBusy &&
        current == _initialEmail &&
        _validEmail(next) &&
        next != _initialEmail;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(text: 'Edit Email', style: AppTextStyle.appBarTitle),
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextField(
                label: 'Current Email',
                controller: _currentCtrl,
                hint: 'Enter your current email',
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'New Email',
                controller: _newCtrl,
                hint: 'Enter your new email',
              ),
              const Spacer(),

              AppButton(
                text: isBusy ? 'Saving...' : 'Save',
                type: canSave ? AppButtonType.primary : AppButtonType.disabled,
                onPressed: !canSave
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        // CACHE TRƯỚC ASYNC GAP
                        final userProvider = context.read<UserProvider>();
                        final navigator = Navigator.of(context);

                        // VERIFY PASSWORD
                        final verified = await showDialog<bool>(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => const VerifyPasswordDialog(),
                        );

                        if (verified != true) return;

                        await userProvider.updateEmail(next);

                        if (!mounted) return;

                        if (userProvider.error == null) {
                          navigator.pop(true);
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
