import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'dart:math';

class ParticlesBackground extends StatefulWidget {
  const ParticlesBackground({super.key});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(15, (index) {
            final size = random.nextDouble() * 6 + 2;
            final screenHeight = MediaQuery.of(context).size.height;
            final screenWidth = MediaQuery.of(context).size.width;

            return Positioned(
              left: random.nextDouble() * screenWidth,
              top:
                  (random.nextDouble() * screenHeight) -
                  (_controller.value * 200),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: kWhiteColor.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
