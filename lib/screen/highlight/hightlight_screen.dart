import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';

class HighlightScreen extends StatefulWidget {
  const HighlightScreen({super.key});

  @override
  State<HighlightScreen> createState() => _HighlightScreenState();
}

class _HighlightScreenState extends State<HighlightScreen> {
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
