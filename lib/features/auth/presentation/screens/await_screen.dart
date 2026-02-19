import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/features/auth/data/services/loginservices.dart';
import 'package:flutter_application_1/core/theme/colors.dart'; // Tus constantes de color
import 'package:flutter_application_1/features/usuario/presentation/screen_usuario.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AwaitConfirm extends StatefulWidget {
  final ScriptsRegistrarse scripts;
  const AwaitConfirm({super.key, required this.scripts});

  @override
  State<AwaitConfirm> createState() => _AwaitConfirmState();
}

class _AwaitConfirmState extends State<AwaitConfirm> {
  @override
  void initState() {
    super.initState();
    verificarEstado(widget.scripts);
  }

  Future<void> verificarEstado(ScriptsRegistrarse scripts) async {
    while (mounted) {
      try {
        await Supabase.instance.client.auth.refreshSession();
        final user = Supabase.instance.client.auth.currentUser;

        if (user != null && user.emailConfirmedAt != null) {
          if (!mounted) return;
          scripts.guardarPerfil();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const PantallaHomeAutenticada()),
          );
          break;
        }
      } catch (_) {}

      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. FONDO DEGRADADO (Consistencia con Login/Register)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kTealColor, kMintColor],
              ),
            ),
          ),

          // 2. CONTENIDO CENTRAL
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: kWhiteColor.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icono animado o temático
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            color: kMintColor,
                            strokeWidth: 3,
                            backgroundColor: kMintColor.withValues(alpha: 0.1),
                          ),
                        ),
                        const Icon(
                          Icons.mark_email_read_outlined,
                          size: 50,
                          color: kTealColor,
                        ),
                      ],
                    ),
                    AppSpacing.h30,

                    const Text(
                      "¡Casi listo!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: kTealColor,
                      ),
                    ),
                    AppSpacing.h15,

                    Text(
                      "Hemos enviado un enlace de confirmación a tu correo.\n\nPor favor, verifica tu bandeja de entrada para activar tu cuenta de viajero.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    ),
                    AppSpacing.h40,

                    // Pie de página decorativo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.airplane_ticket_outlined,
                          color: kPeachColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Esperando confirmación...",
                          style: TextStyle(
                            color: kTealColor.withValues(alpha: 0.6),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
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