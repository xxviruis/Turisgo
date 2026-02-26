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

      /// 👇 AQUÍ está la parte responsive
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth;

          if (constraints.maxWidth < 600) {
            // 📱 Mobile
            cardWidth = constraints.maxWidth * 0.9;
          } else if (constraints.maxWidth < 1024) {
            // 📲 Tablet
            cardWidth = 500;
          } else {
            // 💻 Desktop
            cardWidth = 420;
          }

          return Center(
            child: Container(
              width: cardWidth,
              constraints: const BoxConstraints(minHeight: 350),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 45,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                        0.45,
                      ), // oscuro translúcido
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
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
        },
      ),
    );
  }
}
