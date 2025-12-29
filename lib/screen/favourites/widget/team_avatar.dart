import 'package:flutter/material.dart';

class TeamAvatar extends StatelessWidget {
  final double size;
  final Widget child;

  const TeamAvatar({super.key, required this.size, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.9),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.black),
        child: child,
      ),
    );
  }
}
