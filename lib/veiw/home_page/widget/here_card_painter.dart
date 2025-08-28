import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroCardPainter extends CustomPainter {
  final double animationValue;

  HeroCardPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw animated geometric patterns
    for (int i = 0; i < 3; i++) {
      final progress = (animationValue + i * 0.3) % 1.0;
      paint.color = Colors.white.withOpacity(0.1 * (1 - progress));

      final radius = progress * size.width * 0.8;
      canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.3),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}