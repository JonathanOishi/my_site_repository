import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particle_paint.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particles.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({
    super.key,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  List<Particle> particles = [];

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(
            vsync: this,
            duration: const Duration(
              seconds: 60,
            ),
          )
          ..addListener(updateParticles)
          ..repeat();
  }

  void updateParticles() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    for (final particle in particles) {
      particle.x += particle.velocityX;
      particle.y += particle.velocityY;

      if (particle.x < 0) {
        particle.x = screenWidth;
      }

      if (particle.x > screenWidth) {
        particle.x = 0;
      }

      if (particle.y < 0) {
        particle.y = screenHeight;
      }

      if (particle.y > screenHeight) {
        particle.y = 0;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (particles.isEmpty) {
          final particleCount = Responsive.responsive<int>(
            context: context,
            mobile: 20,
            tablet: 50,
            desktop: 80,
          );

          particles = List.generate(
            particleCount,
            (_) => Particle.random(
              constraints.maxWidth,
              constraints.maxHeight,
            ),
          );
        }

        return CustomPaint(
          size: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
          painter: ParticlePainter(
            particles: particles,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
