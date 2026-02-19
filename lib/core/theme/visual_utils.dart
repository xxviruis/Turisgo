import 'package:flutter/material.dart';

class VisualUtils {
  // Colores de tu paleta para mantener consistencia
  static const Color tealColor = Color(0xFF00A8C6);
  static const Color peachColor = Color(0xFFFF9A76);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static void mostrarErrorDialog(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(Icons.error_outline, color: peachColor, size: 30),
              const SizedBox(width: 10),
              const Text(
                "Atención",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(mensaje, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Entendido",
                style: TextStyle(
                  color: tealColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
