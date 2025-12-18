import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';

class MatchsScreen extends StatefulWidget {
  const MatchsScreen({super.key});

  @override
  State<MatchsScreen> createState() => _MatchsScreenState();
}

class _MatchsScreenState extends State<MatchsScreen> {
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
