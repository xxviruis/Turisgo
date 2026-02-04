// 📂 lib/widgets/button_orbiting_loader.dart

import 'dart:math';
import 'package:flutter/material.dart';

class ButtonOrbitingLoader extends StatefulWidget {
  final String text;
  final Color indicatorColor;

  const ButtonOrbitingLoader({
    super.key,
    this.text = 'Cargando...',
    this.indicatorColor = Colors.white,
  });

  @override
  State<ButtonOrbitingLoader> createState() => _ButtonOrbitingLoaderState();
}

class _ButtonOrbitingLoaderState extends State<ButtonOrbitingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Parámetros ajustados para el tamaño de un botón (muy pequeño)
  final double _centerIconSize = 18;
  final double _orbitIconSize = 10;
  final double _orbitRadius = 15;
  final double _containerSize = 40;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CONTENEDOR DE LA ANIMACIÓN ORBITAL
        SizedBox(
          width: _containerSize,
          height: _containerSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Ícono CENTRAL (El Mundo) - Usamos Icon.public para evitar la carga de red
              Icon(
                Icons.public,
                size: _centerIconSize,
                color: widget.indicatorColor.withOpacity(0.7),
              ),

              // Ícono ORBITAL (El Camión)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double angle = _controller.value * 2 * pi;

                  return Transform.translate(
                    offset: Offset(
                      cos(angle) * _orbitRadius,
                      sin(angle) * _orbitRadius,
                    ),
                    child: Transform.rotate(
                      angle: angle + (pi / 2),
                      child: child,
                    ),
                  );
                },
                // Usamos Icon.local_shipping para evitar la carga de red y ser más rápido
                child: Icon(
                  Icons.local_shipping,
                  size: _orbitIconSize,
                  color: widget.indicatorColor,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // TEXTO
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, color: widget.indicatorColor),
        ),
      ],
    );
  }
}
