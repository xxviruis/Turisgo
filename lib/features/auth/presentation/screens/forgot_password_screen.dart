import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/AnimationPlane.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/Background.dart';
import '../widgets/reset_card.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  void _handleReset() {
    debugPrint("Email: ${_emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kMainGradient),
        child: Stack(
          children: [
            const ParticlesBackground(),
            const AnimatedPlane(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ResetCard(
                  controller: _emailController,
                  onPressed: _handleReset,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
