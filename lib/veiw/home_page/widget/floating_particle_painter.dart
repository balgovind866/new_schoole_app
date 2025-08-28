import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class FloatingParticlesPainter extends CustomPainter {
  final double animationValue;

  FloatingParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw magical floating particles
    for (int i = 0; i < 30; i++) {
      final x = (size.width * (i * 0.2 % 1.0) +
          math.sin(animationValue * 2 * math.pi + i * 0.5) * 50 % size.width);
      final y = (size.height * (i * 0.3 % 1.0) +
          math.cos(animationValue * 2 * math.pi + i * 0.7) * 30 % size.height);

      final opacity = (math.sin(animationValue * 4 * math.pi + i) + 1) * 0.2;
      final hue = (animationValue * 360 + i * 30) % 360;
      paint.color = HSVColor.fromAHSV(opacity, hue, 0.8, 1.0).toColor();

      final particleSize = 1 + math.sin(animationValue * 3 * math.pi + i) * 2;
      canvas.drawCircle(Offset(x, y), particleSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}