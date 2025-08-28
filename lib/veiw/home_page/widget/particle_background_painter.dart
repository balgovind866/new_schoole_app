import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParticleBackgroundPainter extends CustomPainter {
  final double animationValue;
  final ColorScheme colorScheme;

  ParticleBackgroundPainter(this.animationValue, this.colorScheme);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Create animated gradient background
    final gradient = RadialGradient(
      center: Alignment.topLeft,
      radius: 1.5,
      colors: [
        Color(0xFF1a1a2e).withOpacity(0.8),
        Color(0xFF16213e).withOpacity(0.6),
        this.colorScheme.primary.withOpacity(0.1),
      ],
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Draw floating particles
    final particlePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 50; i++) {
      final x = (size.width * (i * 0.1 % 1.0) +
          math.sin(animationValue * 2 * math.pi + i) * 30) % size.width;
      final y = (size.height * (i * 0.17 % 1.0) +
          math.cos(animationValue * 2 * math.pi + i) * 20) % size.height;

      final opacity = (math.sin(animationValue * 2 * math.pi + i) + 1) * 0.3;
      particlePaint.color = Colors.white.withOpacity(opacity);

      canvas.drawCircle(Offset(x, y), 2, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}