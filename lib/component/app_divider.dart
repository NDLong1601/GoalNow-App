import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppDivider extends StatelessWidget {
  final double horizontalPadding;

  const AppDivider({super.key, this.horizontalPadding = 16});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.8,
      height: 1,
      indent: horizontalPadding,
      endIndent: horizontalPadding,
      color: AppColor.divider,
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.white60)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or sign in using',
            style: TextStyle(color: AppColor.white, fontSize: 12),
          ),
        ),
        Expanded(child: Divider(color: Colors.white60)),
      ],
    );
  }
}
