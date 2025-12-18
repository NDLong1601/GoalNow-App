import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_background.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;

  /// Optional
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomInset;

  /// Background control
  final String? backgroundImagePath;
  final double overlayOpacity;

  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
    this.backgroundImagePath,
    this.overlayOpacity = 0.55,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: backgroundImagePath,
      overlayOpacity: overlayOpacity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
