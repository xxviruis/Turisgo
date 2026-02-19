import 'package:flutter/material.dart';

class PaquetesCarrusel extends StatelessWidget {
  PaquetesCarrusel({super.key});

  final List<Map<String, dynamic>> paquetes = [
    {
      "img": "https://picsum.photos/id/401/500/350",
      "nombre": "Paquete Caribe",
      "precio": 1200000,
      "puntuacion": 4.7,
    },
    {
      "img": "https://picsum.photos/id/402/500/350",
      "nombre": "Aventura Andina",
      "precio": 950000,
      "puntuacion": 4.5,
    },
    {
      "img": "https://picsum.photos/id/403/500/350",
      "nombre": "Escapada Romántica",
      "precio": 780000,
      "puntuacion": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Encabezado con "Paquetes" y botón "Ver más"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Paquetes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Acción al pulsar "Ver más"
                  print("Ver más paquetes");
                  // Aquí puedes navegar a una pantalla con la lista completa
                },
                child: const Text(
                  "Ver más",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Carrusel de paquetes
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: paquetes.length,
            itemBuilder: (_, index) {
              final paquete = paquetes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          paquete["img"],
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          paquete["nombre"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Text(
                          "⭐ ${paquete["puntuacion"]} \$${paquete["precio"]} COP",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
