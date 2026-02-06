import 'package:flutter/material.dart';

class HotelesCarrusel extends StatelessWidget {
  HotelesCarrusel({super.key});

  final List<Map<String, dynamic>> hoteles = [
    {
      "img": "https://picsum.photos/id/100/500/350",
      "nombre": "Hotel Paraíso",
      "precio": 120000,
      "puntuacion": 4.5,
    },
    {
      "img": "https://picsum.photos/id/101/500/350",
      "nombre": "Royal Suites",
      "precio": 150000,
      "puntuacion": 4.8,
    },
    {
      "img": "https://picsum.photos/id/102/500/350",
      "nombre": "Hotel Vista Azul",
      "precio": 98000,
      "puntuacion": 4.3,
    },
    {
      "img": "https://picsum.photos/id/103/500/350",
      "nombre": "Dream Resort",
      "precio": 230000,
      "puntuacion": 4.9,
    },
    {
      "img": "https://picsum.photos/id/104/500/350",
      "nombre": "Hotel Montaña",
      "precio": 110000,
      "puntuacion": 4.4,
    },
    {
      "img": "https://picsum.photos/id/121/500/350",
      "nombre": "Laguna Inn",
      "precio": 87000,
      "puntuacion": 4.1,
    },
    {
      "img": "https://picsum.photos/id/106/500/350",
      "nombre": "Sol y Arena",
      "precio": 160000,
      "puntuacion": 4.7,
    },
    {
      "img": "https://picsum.photos/id/107/500/350",
      "nombre": "Caribe Palace",
      "precio": 250000,
      "puntuacion": 4.9,
    },
    {
      "img": "https://picsum.photos/id/108/500/350",
      "nombre": "Hotel Central",
      "precio": 90000,
      "puntuacion": 4.0,
    },
    {
      "img": "https://picsum.photos/id/109/500/350",
      "nombre": "Luxury Stay",
      "precio": 300000,
      "puntuacion": 5.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hoteles.length,
        itemBuilder: (_, index) {
          final hotel = hoteles[index];
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
                      hotel["img"],
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hotel["nombre"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      "⭐ ${hotel["puntuacion"]} \$${hotel["precio"]} COP / noche",
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
    );
  }
}
