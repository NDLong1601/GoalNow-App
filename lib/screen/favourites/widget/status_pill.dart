import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';

class StatusPill extends StatelessWidget {
  final String text;
  final bool isLive;

  const StatusPill({super.key, required this.text, required this.isLive});

  @override
  Widget build(BuildContext context) {
    final bg = isLive
        ? const Color(0xFFE74C3C).withValues(alpha: 0.95)
        : Colors.white.withValues(alpha: 0.12);

    final fg = isLive ? Colors.white : Colors.white70;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: AppText(
        text: text,
        style: AppTextStyle.bodySmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}