import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class AnimatedPlane extends StatefulWidget {
  const AnimatedPlane({super.key});

  @override
  State<AnimatedPlane> createState() => _AnimatedPlaneState();
}

class _AnimatedPlaneState extends State<AnimatedPlane>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;

    _animation = Tween<double>(
      begin: -80,
      end: screenWidth + 80,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Positioned(top: 120, left: _animation.value, child: child!);
      },
      child: Transform.rotate(
        angle: -0.3,
        child: const Icon(Icons.flight, size: 60, color: kWhiteColor),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
