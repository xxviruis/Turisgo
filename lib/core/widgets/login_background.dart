import 'package:flutter/material.dart';

// Este es público, perfecto.
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.network(
        'https://jssaanajelfxnjyjqceq.supabase.co/storage/v1/object/public/imagenes/Background%20Login/WhatsApp%20Image%202026-02-24%20at%209.37.22%20PM.jpeg', // tu imagen aquí
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

// ¡IMPORTANTE!: Quité el "_" para que puedas usarlo en otros archivos
class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    super.key, // Añadí super.key
    required this.size,
    required this.opacity,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final double size;
  final double opacity;
  final Color color;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
