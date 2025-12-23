import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_navigation_item.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/screen/profile/widget/profile_header.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _openEditAndShowSuccess({
    required BuildContext context,
    required String routeName,
    required String successMessage,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final result = await navigator.pushNamed(routeName);

    if (result == true) {
      messenger.hideCurrentMaterialBanner();

      messenger.showMaterialBanner(
        MaterialBanner(
          backgroundColor: AppColor.primary,
          content: Text(
            successMessage,
            style: AppTextStyle.bodyLarge.copyWith(
              color: AppColor.background,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: const [SizedBox.shrink()],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      );

      Future.delayed(
        const Duration(seconds: 2),
        messenger.hideCurrentMaterialBanner,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final user = userProvider.user;

    if (user == null) return const SizedBox.shrink();

    return AppScaffold(
      overlayOpacity: 0.85,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: AppText(text: 'Profile', style: AppTextStyle.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 24),

            AppNavigationItem(
              title: 'Name',
              subtitle: user.name,
              onTap: () async {
                await _openEditAndShowSuccess(
                  context: context,
                  routeName: AppRoute.editName,
                  successMessage: 'Name updated successfully',
                );
              },
            ),

            const Divider(),

            AppNavigationItem(
              title: 'Email',
              subtitle: FormatHelper.formatEmail(user.email),
              onTap: () async {
                await _openEditAndShowSuccess(
                  context: context,
                  routeName: AppRoute.editEmail,
                  successMessage: 'Email updated successfully',
                );
              },
            ),

            const Divider(),

            AppNavigationItem(
              title: 'Password',
              subtitle: '••••••••',
              onTap: () async {
                await _openEditAndShowSuccess(
                  context: context,
                  routeName: AppRoute.changePass,
                  successMessage: 'Password changed successfully',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
