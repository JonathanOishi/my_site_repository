import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/theme/app_colors_theme.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particles.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter({
    required this.particles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.primary.withValues(alpha: 0.7);
    for (final particle in particles) {
      canvas.drawCircle(
        Offset(
          particle.x,
          particle.y,
        ),
        particle.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
