import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class HighlightScreen extends StatefulWidget {
  const HighlightScreen({super.key});

  @override
  State<HighlightScreen> createState() => _HighlightScreenState();
}

class _HighlightScreenState extends State<HighlightScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.85,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(text: 'Highlights', style: AppTextStyle.h2),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list_alt, color: AppColor.iconPrimary),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(height: 1),
            Center(child: Text('Highlight (coming soon)')),
          ],
        ),
      ),
    );
  }
}
