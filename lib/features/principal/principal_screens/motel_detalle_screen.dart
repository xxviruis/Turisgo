import 'package:flutter/material.dart';

class MotelDetalleScreen extends StatelessWidget {
  final Map<String, dynamic> motel;

  const MotelDetalleScreen({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(motel["nombre"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== IMAGEN =====
            Image.asset(
              motel["img"],
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== NOMBRE =====
                  Text(
                    motel["nombre"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ===== UBICACIÓN + PUNTUACIÓN =====
                  Text(
                    "⭐ ${motel["puntuacion"]} • ${motel["ubicación"]}",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 16),

                  // ===== DESCRIPCIÓN =====
                  const Text(
                    "Descripción",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Disfruta de una experiencia única con habitaciones cómodas, "
                    "privacidad total, jacuzzi, parqueadero privado y atención 24/7.",
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  // ===== PRECIOS =====
                  const Text(
                    "Precios",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  _precioItem("Habitación sencilla", "\$60.000"),
                  _precioItem("Habitación con jacuzzi", "\$90.000"),
                  _precioItem("Suite especial", "\$130.000"),

                  const SizedBox(height: 30),

                  // ===== BOTÓN =====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Reservar ahora",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _precioItem(String titulo, String precio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo),
          Text(
            precio,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
