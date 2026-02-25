import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';

class AnimatedFormCard extends StatelessWidget {
  const AnimatedFormCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutQuart,
      builder: (context, value, animationChild) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(opacity: value, child: animationChild),
        );
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30),
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.82),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: kWhiteColor.withOpacity(0.5),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 25,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
  
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
