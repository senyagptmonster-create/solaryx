import 'dart:math' as math;
import 'package:flutter/material.dart';

class SunArcPainter extends CustomPainter {
  final double progress; // 0.0 (sunrise) to 1.0 (sunset)

  const SunArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final horizonY = size.height * 0.82;
    final center = Offset(size.width / 2, horizonY);
    final radius = size.width * 0.42;

    // Horizon line
    final horizonPaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(12, horizonY), Offset(size.width - 12, horizonY), horizonPaint);

    // Parabolic / semicircular arc
    final arcRect = Rect.fromCircle(center: center, radius: radius);
    final arcPaint = Paint()
      ..color = const Color(0xFFF59E0B).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, math.pi, math.pi, false, arcPaint);

    // Golden hour bands at edges
    final goldenPaint = Paint()
      ..color = const Color(0xFFF59E0B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, math.pi, math.pi * 0.15, false, goldenPaint);
    canvas.drawArc(arcRect, math.pi * 1.85, math.pi * 0.15, false, goldenPaint);

    // Sun position
    final clampedProgress = progress.clamp(0.0, 1.0);
    final sunAngle = math.pi + (math.pi * clampedProgress);
    final sunX = center.dx + radius * math.cos(sunAngle);
    final sunY = center.dy + radius * math.sin(sunAngle);

    // Sun glow & disc
    final glowPaint = Paint()
      ..color = const Color(0xFFFBBF24).withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);
    canvas.drawCircle(Offset(sunX, sunY), 20, glowPaint);

    final sunPaint = Paint()
      ..color = const Color(0xFFFDE047)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(sunX, sunY), 10, sunPaint);
  }

  @override
  bool shouldRepaint(covariant SunArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
