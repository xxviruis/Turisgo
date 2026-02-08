import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/principal_screens/principal.dart';
import 'package:flutter_application_1/theme/colors.dart';

class PantallaLogout extends StatefulWidget {
  const PantallaLogout({super.key});

  @override
  State<PantallaLogout> createState() => _PantallaLogoutState();
}

class _PantallaLogoutState extends State<PantallaLogout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 4 segundos para que se vea el viaje con calma
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const PantallaPrincipal()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kTealColor, kMintColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ÁREA DE LA ANIMACIÓN
            SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 1. LA TIERRA GIRANDO (Usando icono nativo para que no falle)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * pi, // Gira sobre su eje
                        child: child,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.public_rounded, // ICONO DE TIERRA
                        size: 140,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // 2. EL CAMIÓN ANDANDO (Orbitando la tierra)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // El ángulo de órbita
                      double angle = (_controller.value * 2 * pi) - (pi / 2);
                      double radius = 105; // Distancia desde el centro

                      return Transform.translate(
                        offset: Offset(
                          cos(angle) * radius,
                          sin(angle) * radius,
                        ),
                        child: Transform.rotate(
                          angle:
                              angle +
                              (pi / 2), // El camión siempre mira al frente
                          child: child,
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.local_shipping_rounded, // ICONO DE CAMIÓN (Truck)
                      size: 50,
                      color: kPeachColor, // Color melocotón de tu paleta
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // MENSAJE FINAL
            const Text(
              "¡Buen viaje!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Guardando tus aventuras...",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
