import 'package:flutter/material.dart';

class HotelDetallePage extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelDetallePage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel["nombre"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGEN PRINCIPAL
            Image.asset(
              hotel["img"],
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            // INFO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel["nombre"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "⭐ ${hotel["puntuacion"]} • ${hotel["ubicación"]}",
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Descripción",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Este hotel ofrece habitaciones cómodas, excelente ubicación, "
                    "servicio de calidad y todas las comodidades necesarias para "
                    "una estancia placentera.",
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Precios desde",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$180.000 COP / noche",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
