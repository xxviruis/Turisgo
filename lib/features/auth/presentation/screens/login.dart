import 'dart:ui'; // Necesario para ImageFilter (Glassmorphism)
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'package:flutter_application_1/core/theme/visual_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool mostrarPassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    final loginUseCase = context.read<LoginUseCase>();

    try {
      await loginUseCase.execute(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return;

      // 🔥 NO decidimos destino aquí
      // El router lo hará automáticamente según rol
      context.go('/home');
    } catch (e) {
      if (!mounted) return;

      VisualUtils.mostrarErrorDialog(context, "Credenciales incorrectas");
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  // Helper para el estilo moderno de los inputs
  InputDecoration _buildModernInputDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: kTealColor.withValues(alpha: 0.8),
        fontWeight: FontWeight.w500,
      ),
      prefixIcon: Icon(icon, color: kTealColor),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: kTealColor.withValues(alpha: 0.05),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: kTealColor.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: kTealColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: kPeachColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: kPeachColor, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tamaño de la pantalla para ubicar decoraciones
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar:
          true, // Permite que el contenido se dibuje detrás de la barra de estado
      body: Stack(
        children: [
          // 1. FONDO CON GRADIENTE (Existente)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kTealColor, kMintColor],
              ),
            ),
          ),

          // 1.1 DECORACIONES DE FONDO (Círculos abstractos para darle vibra de turismo/aire)
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhiteColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kCreamColor.withValues(alpha: 0.15),
              ),
            ),
          ),

          // 2. CONTENIDO PRINCIPAL ANIMADO (Formulario)
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              // Animación de entrada suave
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutQuart,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      50 * (1 - value),
                    ), // Deslizamiento desde abajo
                    child: Opacity(
                      opacity: value, // Fade in
                      child: child,
                    ),
                  );
                },
                child: Form(
                  key: _formKey,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    // Efecto Glassmorphism (Cristal)
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 45,
                            horizontal: 30,
                          ),
                          decoration: BoxDecoration(
                            color: kWhiteColor.withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: kWhiteColor.withValues(alpha: 0.6),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Hero Logo Animado
                              Hero(
                                tag: 'app_logo',
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kTealColor.withValues(
                                          alpha: 0.2,
                                        ),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.travel_explore_rounded,
                                    color: kTealColor,
                                    size: 50,
                                  ),
                                ),
                              ),
                              AppSpacing.h20,
                              const Text(
                                "Turisgo",
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w900,
                                  color: kTealColor,
                                  letterSpacing: -1.0,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Explora el mundo con nosotros",
                                style: TextStyle(
                                  color: Colors.blueGrey.shade400,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 45),

                              // INPUT EMAIL
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: _buildModernInputDecoration(
                                  label: "Correo Electrónico",
                                  icon: Icons.email_outlined,
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Ingresa tu correo"
                                    : null,
                              ),
                              AppSpacing.h18,

                              // INPUT PASSWORD
                              TextFormField(
                                controller: _passwordController,
                                obscureText: mostrarPassword,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: _buildModernInputDecoration(
                                  label: "Contraseña",
                                  icon: Icons.lock_outline,
                                  suffixIcon: IconButton(
                                    splashRadius: 20,
                                    onPressed: () => setState(
                                      () => mostrarPassword = !mostrarPassword,
                                    ),
                                    icon: AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      transitionBuilder: (child, anim) =>
                                          RotationTransition(
                                            turns:
                                                child.key ==
                                                    const ValueKey('icon1')
                                                ? Tween<double>(
                                                    begin: 0.5,
                                                    end: 1,
                                                  ).animate(anim)
                                                : Tween<double>(
                                                    begin: 0.5,
                                                    end: 1,
                                                  ).animate(anim),
                                            child: FadeTransition(
                                              opacity: anim,
                                              child: child,
                                            ),
                                          ),
                                      child: Icon(
                                        mostrarPassword
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        key: ValueKey(mostrarPassword),
                                        color: kTealColor.withValues(
                                          alpha: 0.6,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? "Ingresa tu contraseña"
                                    : null,
                              ),

                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: kTealColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    "¿Olvidaste tu clave?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              AppSpacing.h25,

                              // BOTÓN INGRESAR ANIMADO
                              SizedBox(
                                width: double.infinity,
                                height: 58,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Quitamos padding para usar Ink
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    elevation: 8,
                                    shadowColor: kPeachColor.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  onPressed: isLoading ? null : _onLogin,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          kPeachColor,
                                          Color(0xFFFF8A5C),
                                        ], // Degradado sutil
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
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
                                              "Comenzar Viaje", // Copywriting más turístico
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 3. BOTÓN DE REGRESAR (Aparece arriba a la izquierda, fuera del Scroll para que sea fijo)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: kWhiteColor.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                  border: Border.all(color: kWhiteColor.withValues(alpha: 0.3)),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kWhiteColor,
                    size: 22,
                  ),
                  onPressed: () => context.pop(),
                  tooltip: "Regresar",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
