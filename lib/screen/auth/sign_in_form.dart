import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_divider.dart';
import 'package:goalnow_app/component/app_rich_text.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/screen/auth/widget/social_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool rememberMe = false;

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 140,
                        child: Image.asset(AppAssetsPath.logoMarker),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: AppText(
                          text: 'SIGN IN',
                          style: AppTextStyle.h1.copyWith(fontSize: 28),
                        ),
                      ),

                      const SizedBox(height: 40),

                      AppTextField(
                        label: 'Email Address',
                        hint: 'Enter your email',
                        controller: emailCtrl,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      AppPasswordField(
                        label: 'Password',
                        controller: passwordCtrl,
                        validator: (v) {
                          if (v == null || v.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (v) =>
                                setState(() => rememberMe = v ?? false),
                            activeColor: AppColor.primary,
                          ),
                          Expanded(
                            child: Text(
                              'Remember me',
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColor.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: AppText(
                              text: 'Forgot password?',
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      AppButton(
                        text: 'Sign In',
                        type: AppButtonType.primary,
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form != null && form.validate()) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.bottomTab,
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 24),
                      OrDivider(),

                      const SizedBox(height: 16),
                      SocialButton(),

                      const SizedBox(height: 24),
                      Center(
                        child: AppRichText(
                          text: "Don't have an account? ",
                          actionText: 'Sign Up',
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.signUp);
                          },
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
