import 'dart:math';

class Particle {
  double x;
  double y;

  double radius;

  double velocityX;
  double velocityY;

  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.velocityX,
    required this.velocityY,
  });

  factory Particle.random(
    double width,
    double height,
  ) {
    final random = Random();

    return Particle(
      x: random.nextDouble() * width,
      y: random.nextDouble() * height,

      radius: random.nextDouble() * 3 + 1,

      velocityX: (random.nextDouble() - 0.5) * 1.5,
      velocityY: (random.nextDouble() - 0.5) * 1.5,
    );
  }
}
