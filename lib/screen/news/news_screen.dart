import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        overlayOpacity: 0.85,
        body: Column(children: [AppText(text: 'Match')]),
      ),
    );
  }
}
