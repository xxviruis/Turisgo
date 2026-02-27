import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:go_router/go_router.dart';

// -----------------------------------------------------------------------------
// SECCIÓN DEL LOGO
// -----------------------------------------------------------------------------
class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'app_logo',
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.7),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.travel_explore_rounded,
              color: kTealColor,
              size: 55,
            ),
          ),
        ),
        AppSpacing.h20,
        const Text(
          'Turisgo',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(135, 12, 189, 136),
            letterSpacing: -0.5,
          ),
        ),
        AppSpacing.h5,
        Text(
          'Explora el mundo con nosotros',
          style: TextStyle(
            color: const Color.fromARGB(176, 255, 255, 255),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// CAMPO DE EMAIL
// -----------------------------------------------------------------------------
class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  static final _emailRegex = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      decoration: buildLoginInputDecoration(
        label: 'Correo Electrónico',
        icon: Icons.email_outlined,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Ingresa tu correo';
        if (!_emailRegex.hasMatch(value)) return 'Ingresa un correo válido';
        return null;
      },
    );
  }
}

// -----------------------------------------------------------------------------
// CAMPO DE CONTRASEÑA
// -----------------------------------------------------------------------------
class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isHidden;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    required this.isHidden,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHidden,
      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      decoration: buildLoginInputDecoration(
        label: 'Contraseña',
        icon: Icons.lock_outline,
        suffixIcon: IconButton(
          splashRadius: 20,
          onPressed: onToggleVisibility,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Icon(
              isHidden
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              key: ValueKey(isHidden),
              color: kTealColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'Ingresa tu contraseña' : null,
    );
  }
}

// -----------------------------------------------------------------------------
// BOTÓN DE LOGIN (CON GRADIENTE)
// -----------------------------------------------------------------------------
class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Color.fromARGB(135, 12, 189, 136),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            alignment: Alignment.center,
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: kWhiteColor,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Text(
                    'Comenzar Viaje',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,
                      letterSpacing: 0.5,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// DECORACIÓN COMPARTIDA (FUNCIÓN AYUDANTE)
// -----------------------------------------------------------------------------
InputDecoration buildLoginInputDecoration({
  required String label,
  required IconData icon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontWeight: FontWeight.w500,
    ),
    prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.6)),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.black.withOpacity(0.35),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kTealColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kPeachColor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kPeachColor, width: 2),
    ),
  );
}

class LoginBackButton extends StatelessWidget {
  const LoginBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.25),
            shape: BoxShape.circle,
            border: Border.all(color: kWhiteColor.withOpacity(0.3)),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kWhiteColor,
              size: 22,
            ),
            onPressed: () => context.go('/'),
            tooltip: 'Regresar',
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.push('/forgot-password');
        },
        style: TextButton.styleFrom(
          foregroundColor: kTealColor.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
