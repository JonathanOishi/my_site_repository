// particles_back.dart
import 'package:flutter/material.dart';
import 'package:jonathan_oishi_portfolio/core/responsive/responsive.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particle_paint.dart';
import 'package:jonathan_oishi_portfolio/features/view/widgets/particles/particles.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> _particles;
  late _ParticleNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _particles = [];
    _notifier = _ParticleNotifier();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();

    _controller.addListener(_updateParticles);
  }

  void _updateParticles() {
    if (!mounted) return;
    final size = MediaQuery.of(context).size;

    for (final p in _particles) {
      p.x += p.velocityX;
      p.y += p.velocityY;
      if (p.x < 0) p.x = size.width;
      if (p.x > size.width) p.x = 0;
      if (p.y < 0) p.y = size.height;
      if (p.y > size.height) p.y = 0;
    }

    _notifier.notify();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_particles.isEmpty) {
          final count = Responsive.responsive<int>(
            context: context,
            mobile: 20,
            tablet: 50,
            desktop: 80,
          );
          _particles = List.generate(
            count,
            (_) => Particle.random(constraints.maxWidth, constraints.maxHeight),
          );
        }

        return AnimatedBuilder(
          animation: _notifier,
          builder: (context, _) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: ParticlePainter(particles: _particles),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _notifier.dispose();
    super.dispose();
  }
}

class _ParticleNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}
