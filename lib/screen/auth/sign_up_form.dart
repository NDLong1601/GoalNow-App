import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_button.dart';
import 'package:goalnow_app/component/app_divider.dart';
import 'package:goalnow_app/component/app_rich_text.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/screen/auth/widget/auth_background.dart';
import 'package:goalnow_app/screen/auth/widget/auth_controller.dart';
import 'package:goalnow_app/screen/auth/widget/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  bool agreeTerms = false;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: LayoutBuilder(
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

                      Center(
                        child: AppText(
                          text: 'SIGN UP',
                          style: AppTextStyle.h1.copyWith(fontSize: 28),
                        ),
                      ),

                      const SizedBox(height: 40),

                      AppTextField(
                        label: 'Display name',
                        hint: 'Enter your fullname',
                        controller: nameCtrl,
                        prefixIcon: Icons.person_outline,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Full name is required';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
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
                        hint: 'Enter your password',
                        controller: passwordCtrl,
                        validator: (v) {
                          if (v == null || v.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      AppPasswordField(
                        label: 'Confirm password',
                        hint: 'Confirm Password',
                        controller: confirmPasswordCtrl,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (v != passwordCtrl.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Checkbox(
                            value: agreeTerms,
                            onChanged: (v) {
                              setState(() {
                                agreeTerms = v ?? false;
                              });
                            },
                            activeColor: const Color(0xFF21D07A),
                          ),
                          Expanded(
                            child: Text(
                              'I agree to the Terms of Service and Privacy Policy',
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColor.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      AppButton(
                        text: 'Create account',
                        type: agreeTerms
                            ? AppButtonType.primary
                            : AppButtonType.disabled,
                        onPressed: agreeTerms ? _onSubmit : null,
                      ),

                      const SizedBox(height: 24),
                      OrDivider(),
                      const SizedBox(height: 16),
                      SocialButton(),
                      const SizedBox(height: 24),
                      Center(
                        child: AppRichText(
                          text: 'Already have an account? ',
                          actionText: 'Sign In',
                          onTap: () {
                            Navigator.pop(context);
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
      ),
    );
  }

  void _onSubmit() {
    AuthController.signUp(
      context: context,
      formKey: _formKey,
      name: nameCtrl.text,
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );
  }
}
