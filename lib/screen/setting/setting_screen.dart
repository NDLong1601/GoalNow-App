import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_divider.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/extension/context_extension.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/screen/setting/widget/legal_support.dart';
import 'package:goalnow_app/screen/setting/widget/section_tile.dart';
import 'package:goalnow_app/screen/setting/widget/setting_tile.dart';
import 'package:goalnow_app/screen/setting/widget/user_card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool matchReminder = true;
  bool liveScore = true;
  bool halfFullTime = false;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(text: 'Setting', style: AppTextStyle.appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDivider(),
              UserProfile(),
              const SizedBox(height: 24),
              SectionTitle(title: 'Notification Settings'),
              SettingTile(
                title: 'Match Reminders',
                subtitle: 'Get notifications before matches start.',
                value: matchReminder,
                onChanged: (v) => setState(() => matchReminder = v),
              ),
              AppDivider(),
              SettingTile(
                title: 'Live Score Updates',
                subtitle: 'Receive real-time score changes during matches.',
                value: liveScore,
                onChanged: (v) => setState(() => liveScore = v),
              ),
              AppDivider(),
              SettingTile(
                title: 'Half-time & Full-time Updates',
                subtitle: 'Get alerts at half-time and final whistle.',
                value: halfFullTime,
                onChanged: (v) => setState(() => halfFullTime = v),
              ),

              const SizedBox(height: 24),
              SectionTitle(title: 'Theme Settings'),
              SettingTile(
                title: 'Dark Mode',
                subtitle: 'Switch between light and dark visual themes.',
                value: darkMode,
                onChanged: (v) => setState(() => darkMode = v),
              ),

              const SizedBox(height: 24),
              SectionTitle(title: 'Legal & Support'),
              LegalSupportSection(),
              const SizedBox(height: 32),
              Center(
                child: AppButton(
                  text: 'Logout',
                  type: AppButtonType.danger,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoute.signIn,
                      (route) => false,
                    );
                  },
                ),
              ),
              SizedBox(height: 80 / 812 * context.sh),
            ],
          ),
        ),
      ),
    );
  }
}
