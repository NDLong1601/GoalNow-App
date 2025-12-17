import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class EditNameScreen extends StatefulWidget {
  const EditNameScreen({super.key});

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  late final TextEditingController _controller;
  late final String _initialName;

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProvider>().user!;
    _initialName = user.name;
    _controller = TextEditingController(text: _initialName);
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final isBusy = provider.isLoading;

    final newName = _controller.text.trim();
    final canSave = !isBusy && newName.isNotEmpty && newName != _initialName;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(text: 'Edit Name', style: AppTextStyle.appBarTitle),
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
              AppTextField(label: 'Full Name', controller: _controller),
              const Spacer(),

              AppButton(
                text: isBusy ? 'Saving...' : 'Save',
                type: canSave ? AppButtonType.primary : AppButtonType.disabled,
                onPressed: !canSave
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        final userProvider = context.read<UserProvider>();
                        final navigator = Navigator.of(context);

                        await userProvider.updateName(newName);

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
