import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textstyle.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 16, top: 16, bottom: 8),
      child: Text(title, style: AppTextStyle.h2),
    );
  }
}
