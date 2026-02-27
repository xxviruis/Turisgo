import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class RestauranteDetallePage extends StatelessWidget {
  final Map<String, dynamic> restaurante;

  const RestauranteDetallePage({super.key, required this.restaurante});

  void _llamar() async {
    if (restaurante["telefono"] == null) return;

    final Uri url = Uri.parse("tel:${restaurante["telefono"]}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imagenes = restaurante["imagenes"] != null
        ? List<String>.from(restaurante["imagenes"])
        : [restaurante["img"]];

    return Scaffold(
      appBar: AppBar(title: Text(restaurante["nombre"])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== GALERÍA =====
            SizedBox(
              height: 240,
              child: PageView.builder(
                itemCount: imagenes.length,
                itemBuilder: (_, index) {
                  return Image.asset(
                    imagenes[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),

            AppSpacing.h16,

            // ===== INFORMACIÓN =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurante["nombre"],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  AppSpacing.h6,

                  Text(
                    "⭐ ${restaurante["puntuacion"]} • ${restaurante["ubicacion"]}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  AppSpacing.h12,

                  _infoRow(
                    Icons.restaurant,
                    restaurante["tipo"] ?? "No especificado",
                  ),
                  _infoRow(
                    Icons.schedule,
                    restaurante["horario"] ?? "Horario no disponible",
                  ),
                  _infoRow(Icons.attach_money, restaurante["precio"] ?? "N/A"),
                  _infoRow(
                    Icons.phone,
                    restaurante["telefono"] ?? "No disponible",
                  ),

                  AppSpacing.h16,

                  const Text(
                    "Descripción",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  AppSpacing.h6,

                  Text(
                    restaurante["descripcion"] ?? "Sin descripción disponible.",
                    style: const TextStyle(fontSize: 14),
                  ),

                  AppSpacing.h16,

                  if (restaurante["servicios"] != null) ...[
                    const Text(
                      "Servicios",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.h8,
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        restaurante["servicios"].length,
                        (index) =>
                            Chip(label: Text(restaurante["servicios"][index])),
                      ),
                    ),
                  ],

                  AppSpacing.h24,

                  // ===== BOTONES =====
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: restaurante["telefono"] != null
                              ? _llamar
                              : null,
                          icon: const Icon(Icons.call),
                          label: const Text("Llamar"),
                        ),
                      ),
                      AppSpacing.h12,
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Reserva próximamente"),
                              ),
                            );
                          },
                          icon: const Icon(Icons.event_available),
                          label: const Text("Reservar"),
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.h30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 18),
          AppSpacing.h6,
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}