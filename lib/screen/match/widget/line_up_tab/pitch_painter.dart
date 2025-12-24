import 'package:flutter/material.dart';

class PitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final w = size.width;
    final h = size.height;

    // Outer border
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(8, 8, w - 16, h - 16),
        const Radius.circular(12),
      ),
      paint,
    );

    // Center line
    canvas.drawLine(Offset(8, h / 2), Offset(w - 8, h / 2), paint);

    // Center circle
    canvas.drawCircle(Offset(w / 2, h / 2), w * 0.12, paint);

    // Penalty boxes
    canvas.drawRect(Rect.fromLTWH(w * 0.2, 8, w * 0.6, h * 0.18), paint);
    canvas.drawRect(
      Rect.fromLTWH(w * 0.2, h - h * 0.18 - 8, w * 0.6, h * 0.18),
      paint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}