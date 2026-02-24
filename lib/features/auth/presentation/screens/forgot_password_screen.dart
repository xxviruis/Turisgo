import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_dialogs.dart';
import 'package:flutter_application_1/core/widgets/custom_inputs.dart';
import 'package:flutter_application_1/features/auth/presentation/controllers/forgot_password_controller.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _sendCode() async {
    final controller = context.read<ForgotPasswordController>();
    await controller.sendCode(_emailController.text.trim());

    if (!mounted) return;
    if (controller.status == ForgotStatus.error) {
      CustomDialogs.showError(
        context,
        controller.errorMessage ?? 'Error al enviar código',
      );
    }
  }

  Future<void> _resetPassword() async {
    final controller = context.read<ForgotPasswordController>();
    await controller.verifyAndReset(
      email: _emailController.text.trim(),
      code: _codeController.text.trim(),
      newPassword: _passwordController.text.trim(),
    );

    if (!mounted) return;
    if (controller.status == ForgotStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Contraseña actualizada con éxito!')),
      );
      Navigator.pop(context);
    } else {
      CustomDialogs.showError(
        context,
        controller.errorMessage ?? 'Error al restablecer',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();

    return Scaffold(
      body: Stack(
        children: [
          const _GradientBackground(),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _GlassCard(
                emailController: _emailController,
                codeController: _codeController,
                passwordController: _passwordController,
                controller: controller,
                onSendCode: _sendCode,
                onResetPassword: _resetPassword,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Subwidgets
// -----------------------------------------------------------------------------

class _GradientBackground extends StatelessWidget {
  const _GradientBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F766E), Color(0xFF1E88E5), Color(0xFF4FC3F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({
    required this.emailController,
    required this.codeController,
    required this.passwordController,
    required this.controller,
    required this.onSendCode,
    required this.onResetPassword,
  });

  final TextEditingController emailController;
  final TextEditingController codeController;
  final TextEditingController passwordController;
  final ForgotPasswordController controller;
  final VoidCallback onSendCode;
  final VoidCallback onResetPassword;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_reset, size: 70, color: Color(0xFF4ECDC4)),
              const SizedBox(height: 20),
              const Text(
                'Recuperar contraseña',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              GlassInput(
                controller: emailController,
                hint: 'Correo electrónico',
                type: TextInputType.emailAddress,
                enabled: !controller.isCodeSent,
              ),
              if (controller.isCodeSent) ...[
                const SizedBox(height: 20),
                GlassInput(
                  controller: codeController,
                  hint: 'Código de 6 dígitos',
                  type: TextInputType.number,
                ),
                const SizedBox(height: 20),
                GlassInput(
                  controller: passwordController,
                  hint: 'Nueva contraseña',
                  obscure: true,
                ),
              ],
              const SizedBox(height: 30),
              _SubmitButton(
                controller: controller,
                onSendCode: onSendCode,
                onResetPassword: onResetPassword,
              ),
              if (controller.isCodeSent)
                TextButton(
                  onPressed: controller.reset,
                  child: const Text(
                    '¿Correo incorrecto?',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.controller,
    required this.onSendCode,
    required this.onResetPassword,
  });

  final ForgotPasswordController controller;
  final VoidCallback onSendCode;
  final VoidCallback onResetPassword;

  String get _label {
    if (controller.isCooldownActive && !controller.isCodeSent) {
      return 'Reintentar en ${controller.cooldownSeconds}s';
    }
    return controller.isCodeSent ? 'Cambiar contraseña' : 'Enviar código';
  }

  VoidCallback? get _onPressed {
    if (controller.isLoading) return null;
    if (controller.isCooldownActive && !controller.isCodeSent) return null;
    return controller.isCodeSent ? onResetPassword : onSendCode;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          backgroundColor: const Color(0xFF00C6FF),
          disabledBackgroundColor: Colors.white10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: controller.isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(
                _label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
