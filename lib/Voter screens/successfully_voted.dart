import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/services.dart';

class SuccessfullyVotedScreen extends StatefulWidget {
  const SuccessfullyVotedScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfullyVotedScreen> createState() =>
      _SuccessfullyVotedScreenState();
}

class _SuccessfullyVotedScreenState extends State<SuccessfullyVotedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  bool _confettiVisible = false;
  final List<Confetti> _confettiParticles = [];

  // Timer variables
  int _secondsRemaining = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Generate confetti particles
    for (int i = 0; i < 50; i++) {
      _confettiParticles.add(Confetti(
        color: _getRandomConfettiColor(),
        position: Offset(
          math.Random().nextDouble() * 400 - 200,
          math.Random().nextDouble() * -300,
        ),
        size: math.Random().nextDouble() * 10 + 5,
        velocity: Offset(
          math.Random().nextDouble() * 6 - 3,
          math.Random().nextDouble() * 3 + 3,
        ),
      ));
    }

    // Set up animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start animations after a short delay
    Future.delayed(Duration(milliseconds: 300), () {
      _controller.forward();
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _confettiVisible = true;
        });
      });
    });

    // Start the 5-second timer
  }

  Color _getRandomConfettiColor() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal,
    ];
    return colors[math.Random().nextInt(colors.length)];
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel(); // Don't forget to cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vote Confirmation',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/manipal_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Animated background gradient
          AnimatedContainer(
            duration: const Duration(seconds: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Color(0xffE76239),
                  Colors.orange,
                ],
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter:
                  _confettiVisible ? ConfettiPainter(_confettiParticles) : null,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated success icon
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 100,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    // Animated text
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _opacityAnimation.value,
                          child: const Column(
                            children: [
                              Text(
                                'Successfully Voted!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Thank you for participating in the election',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Confetti particle class
class Confetti {
  Offset position;
  Offset velocity;
  double size;
  Color color;
  double rotation = math.Random().nextDouble() * 360;

  Confetti({
    required this.position,
    required this.velocity,
    required this.size,
    required this.color,
  });
}

// Confetti painter
class ConfettiPainter extends CustomPainter {
  final List<Confetti> confetti;

  ConfettiPainter(this.confetti);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var particle in confetti) {
      paint.color = particle.color;

      // Update particle position for animation
      particle.position += particle.velocity;
      particle.rotation += 2;

      // Reset particle if it falls off screen
      if (particle.position.dy > size.height) {
        particle.position = Offset(
          math.Random().nextDouble() * size.width,
          -10,
        );
      }

      // Draw confetti particle
      canvas.save();
      canvas.translate(
          size.width / 2 + particle.position.dx, particle.position.dy);
      canvas.rotate(particle.rotation * math.pi / 180);
      canvas.drawRect(
        Rect.fromCenter(
            center: Offset.zero,
            width: particle.size,
            height: particle.size * 0.5),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
