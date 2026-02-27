import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/core/widgets/boton_carga.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/await_screen.dart';
import 'package:flutter_application_1/features/auth/data/services/loginservices.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/app_inputs.dart';
import 'package:flutter_application_1/core/theme/colors.dart';
import 'package:flutter_application_1/core/theme/visual_utils.dart';
import 'package:go_router/go_router.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse>
    with SingleTickerProviderStateMixin {
  final ScriptsRegistrarse logic = ScriptsRegistrarse();
  bool isLoading = false;
  bool _mostrarPassword = true;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<String> roles = ['Turista', 'Prestador de servicios'];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    logic.dispose();
    super.dispose();
  }

  Future<void> _onRegistrar() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    final mensaje = await logic.registrar();

    if (mounted) setState(() => isLoading = false);

    if (mensaje != null) {
      VisualUtils.mostrarErrorDialog(context, mensaje);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AwaitConfirm(scripts: logic)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🌊 FONDO DINÁMICO
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kTealColor, kMintColor],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.4,
                colors: [
                  Colors.white.withValues(alpha: 0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          /// 🔙 BOTÓN BACK
          Positioned(
            top: 55,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: kWhiteColor),
              onPressed: () =>
                  context.go('/'), // Usamos GoRouter para navegación
            ),
          ),

          /// ✨ FORMULARIO ANIMADO
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 40,
                  ),
                  child: Form(
                    key: logic.key,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          padding: const EdgeInsets.symmetric(
                            vertical: 50,
                            horizontal: 35,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.88),
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 40,
                                offset: const Offset(0, 25),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// 🌍 ICONO PRINCIPAL
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      kTealColor.withValues(alpha: 0.2),
                                      kMintColor.withValues(alpha: 0.2),
                                    ],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.public,
                                  size: 50,
                                  color: kTealColor,
                                ),
                              ),

                              const SizedBox(height: 25),

                              const Text(
                                "Crea tu aventura",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: kTealColor,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                "Empieza tu experiencia turística",
                                style: TextStyle(color: Colors.black54),
                              ),

                              AppSpacing.h35,

                              /// ROL
                              DropdownButtonFormField<String>(
                                value: logic.rolSeleccionado,
                                decoration: inputStyle(
                                  label: "Rol",
                                  icon: Icons.person_outline,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor: Colors.white,
                                items: roles
                                    .map(
                                      (r) => DropdownMenuItem(
                                        value: r,
                                        child: Text(r),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) => setState(
                                  () => logic.rolSeleccionado = value,
                                ),
                                validator: (value) =>
                                    value == null ? 'Seleccione un rol' : null,
                              ),

                              AppSpacing.h18,

                              TextFormField(
                                controller: logic.txtEmail,
                                decoration: inputStyle(
                                  label: "Correo Electrónico",
                                  icon: Icons.email_outlined,
                                ),
                                validator: logic.gmailValidator,
                              ),

                              AppSpacing.h18,

                              TextFormField(
                                controller: logic.txtPhone,
                                keyboardType: TextInputType.phone,
                                decoration: inputStyle(
                                  label: "Celular (Opcional)",
                                  icon: Icons.phone_android_outlined,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                              ),

                              AppSpacing.h18,

                              TextFormField(
                                controller: logic.txtPassword,
                                obscureText: _mostrarPassword,
                                decoration:
                                    inputStyle(
                                      label: "Contraseña",
                                      icon: Icons.lock_outline,
                                    ).copyWith(
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(
                                          () => _mostrarPassword =
                                              !_mostrarPassword,
                                        ),
                                        icon: Icon(
                                          _mostrarPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: kTealColor,
                                        ),
                                      ),
                                    ),
                                validator: logic.passwordValidator,
                              ),

                              AppSpacing.h18,
                              TextFormField(
                                controller: logic.txtConfirmPassword,
                                obscureText: _mostrarPassword,
                                decoration:
                                    inputStyle(
                                      label: "Confirmar Contraseña",
                                      icon: Icons.lock_outline,
                                    ).copyWith(
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(
                                          () => _mostrarPassword =
                                              !_mostrarPassword,
                                        ),
                                        icon: Icon(
                                          _mostrarPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: kTealColor,
                                        ),
                                      ),
                                    ),
                                validator: logic.passwordValidator,
                              ),

                              AppSpacing.h35,

                              /// 🔥 BOTÓN DINÁMICO
                              SizedBox(
                                width: double.infinity,
                                height: 58,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPeachColor,
                                    elevation: 12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: isLoading ? null : _onRegistrar,
                                  child: isLoading
                                      ? const ButtonOrbitingLoader()
                                      : const Text(
                                          "Registrarme",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}
