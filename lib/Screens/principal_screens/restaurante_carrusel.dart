import 'package:flutter/material.dart';

class RestaurantesCarrusel extends StatelessWidget {
  RestaurantesCarrusel({super.key});

  final List<Map<String, dynamic>> restaurantes = [
    {
      "img": "https://picsum.photos/id/200/500/350",
      "nombre": "La Parrilla Roja",
      "precio": 35000,
      "puntuacion": 4.7,
    },
    {
      "img": "https://picsum.photos/id/201/500/350",
      "nombre": "Sabores del Mar",
      "precio": 42000,
      "puntuacion": 4.6,
    },
    {
      "img": "https://picsum.photos/id/202/500/350",
      "nombre": "Rincón Mexicano",
      "precio": 28000,
      "puntuacion": 4.4,
    },
    {
      "img": "https://picsum.photos/id/203/500/350",
      "nombre": "Pizza Italia",
      "precio": 30000,
      "puntuacion": 4.5,
    },
    {
      "img": "https://picsum.photos/id/204/500/350",
      "nombre": "Burguer House",
      "precio": 25000,
      "puntuacion": 4.2,
    },
    {
      "img": "https://picsum.photos/id/201/500/350",
      "nombre": "Café Colonial",
      "precio": 15000,
      "puntuacion": 4.8,
    },
    {
      "img": "https://picsum.photos/id/206/500/350",
      "nombre": "Sushi Master",
      "precio": 38000,
      "puntuacion": 4.9,
    },
    {
      "img": "https://picsum.photos/id/210/500/350",
      "nombre": "Donde la casa de karol",
      "precio": 45000,
      "puntuacion": 4.6,
    },
    {
      "img": "https://picsum.photos/id/208/500/350",
      "nombre": "Arepas Doña Tere",
      "precio": 12000,
      "puntuacion": 4.3,
    },
    {
      "img": "https://picsum.photos/id/209/500/350",
      "nombre": "Las Delicias",
      "precio": 18000,
      "puntuacion": 4.4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurantes.length,
        itemBuilder: (_, index) {
          final r = restaurantes[index];
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
                      r["img"],
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      r["nombre"],
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
                      "⭐ ${r["puntuacion"]} Promedio \$${r["precio"]} COP",
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
