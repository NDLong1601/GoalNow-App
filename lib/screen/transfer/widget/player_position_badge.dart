import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';

class PlayerPositionBadge extends StatelessWidget {
  final String? label;
  final String? positionKey;

  const PlayerPositionBadge({
    super.key,
    required this.label,
    required this.positionKey,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null || label!.isEmpty) {
      return const SizedBox.shrink();
    }

    final style = _PositionStyle.fromKey(positionKey);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(14),
        border: BoxBorder.all(color: style.foreground),
      ),
      child: AppText(
        text: label!,
        style: AppTextStyle.caption.copyWith(
          color: style.foreground,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

class _PositionStyle {
  final Color background;
  final Color foreground;

  const _PositionStyle(this.background, this.foreground);

  static _PositionStyle fromKey(String? key) {
    final k = key?.toLowerCase() ?? '';

    /// GOALKEEPER
    if (k.contains('keeper') || k.contains('gk')) {
      return const _PositionStyle(
        Color(0xFF1976D2), // blue
        Colors.white,
      );
    }

    /// DEFENDER
    if (k.contains('back') || k.contains('defender') || k.contains('cb')) {
      return const _PositionStyle(
        Color(0xFF2E7D32), // green
        Colors.white,
      );
    }

    /// MIDFIELDER
    if (k.contains('midfielder') || k.contains('mid')) {
      return const _PositionStyle(
        Color(0xFFFBC02D), // yellow
        Colors.black,
      );
    }

    /// FORWARD / STRIKER
    if (k.contains('forward') ||
        k.contains('striker') ||
        k.contains('leftwinger') ||
        k.contains('rightwinger') ||
        k.contains('attacker')) {
      return const _PositionStyle(
        Color(0xFFC62828), // red
        Colors.white,
      );
    }

    /// DEFAULT
    return const _PositionStyle(
      Color(0xFF616161), // grey
      Colors.white,
    );
  }
}
